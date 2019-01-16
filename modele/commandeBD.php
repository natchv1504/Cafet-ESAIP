<?php 
/*Fonctions-modèle réalisant les requètes de gestion des contacts en base de données*/

function commandes() {
	require ("modele/connectBD.php") ; //connexion $link à MYSQL et sélection de la base

	$sql = "select c.numeroCommande as numCo, u.login as log, c.prix as prix, date from commande c, utilisateurs u
			where c.id_utilisateurs = u.id";
	
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
?>
