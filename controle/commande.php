<?php 
/*
  fonctions-action de gestion des commandes
*/

function liste_commandes() {
	
	require ("modele/commandeBD.php");
	$Commandes = commandes();
	require ("./vue/utilisateur/commandes.tpl");
	
}

function valider_commande() {
	//que faire dans la bdd quand valide commande ?
}

?>
