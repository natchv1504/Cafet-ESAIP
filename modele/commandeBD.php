<?php 
/*Fonctions-modèle réalisant les requètes de gestion des contacts en base de données*/

function commandes() {
	require ("modele/connectBD.php") ; //connexion $link à MYSQL et sélection de la base

	$sql = "SELECT c.numeroCommande as NumeroCommande, 
					u.login as Login, 
					cast(sum(c.prix) as decimal(16,2)) as Prix, 
					GROUP_CONCAT(p.nomPlat SEPARATOR ',') as Description, 
					c.date as Date
			FROM utilisateurs u, commande c 
			LEFT JOIN plat p ON p.id = c.id_plat 
			WHERE c.id_utilisateurs = u.id 
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
?>
