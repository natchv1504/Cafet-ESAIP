<?php 
/*Fonctions-modèle réalisant les requètes de gestion des commandes en base de données*/
function commandes() {
	require ("modele/connectBD.php") ; //connexion $link à MYSQL et sélection de la base

	$sql = "SELECT c.numeroCommande as NumeroCommande, 
					u.login as Login, 
					cast(sum(c.prix) as decimal(16,2)) as Prix, 
					GROUP_CONCAT(p.nomPlat SEPARATOR ', ') as Description, 
					c.date as Date
			FROM utilisateurs u, commande c 
			LEFT JOIN plat p ON p.id = c.id_plat 
			WHERE c.id_utilisateurs = u.id AND c.isChecked = 0
			GROUP BY NumeroCommande ORDER BY Date";
	
	$res = mysqli_query($link, $sql)	
		or die (utf8_encode("erreur de requête : ") . $sql); 

	if (mysqli_num_rows ($res) == 0) {
		return false; //"pas de commandes";
	}
	else {
		$C= array();
		while ($c = mysqli_fetch_assoc($res) and isset($c)) {
			$C[] = $c; //stockage des commandes dans $C
		}			
		return $C;
	}
}

if(isset($_POST["fonction"]) && $_POST["fonction"] == 'isChecked' && isset($_POST["num"]) && !empty($_POST["num"])){
	echo isChecked($_POST["num"]);
}

function isChecked($num) {
	require ("./connectBD.php") ;

	$numCo = mysqli_real_escape_string($link, $num);

	$sql = "UPDATE commande c 
			SET c.isChecked = 1
			WHERE c.numeroCommande = '$numCo'";

	$res = mysqli_query($link, $sql)	
		or die (utf8_encode("erreur de requête : ") . $sql);

	return $num;
}

function edit(){
	require ("modele/connectBD.php");

	$sql = "SELECT id, nomPlat, prix, prixMenu FROM plat";
	
	$res = mysqli_query($link, $sql)	
		or die (utf8_encode("erreur de requête : ") . $sql); 

	$tab= array();
	while ($c = mysqli_fetch_assoc($res) and isset($c)) {
		$tab[] = $c; //tableau de produits
	}			
	return $tab;
}

if(isset($_POST["fonction"]) && $_POST["fonction"] == 'editBD' && isset($_POST["tabPlat"]) && !empty($_POST["tabPlat"])){
	$tabPlat = json_decode($_POST["tabPlat"]);
	echo json_encode(editBD($tabPlat));
}

function editBD($tabPlat) {
	require ("./connectBD.php") ;
	
	$id = mysqli_real_escape_string($link, $tabPlat[0]);
	$nomPlat = mysqli_real_escape_string($link, $tabPlat[1]);
	$prix = mysqli_real_escape_string($link, $tabPlat[2]);
	$prixMenu = mysqli_real_escape_string($link, $tabPlat[3]);
	
	$sql = "UPDATE plat
			SET nomPlat = '$nomPlat', prix = '$prix', prixMenu = '$prixMenu'
			WHERE id = '$id'";

	$res = mysqli_query($link, $sql)	
		or die (utf8_encode("erreur de requête : ") . $sql);

	return $tabPlat;
}


?>
