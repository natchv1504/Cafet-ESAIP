<?php 
/*
  fonctions-action de gestion des commandes
*/

function liste_commandes() {
	
	require ("modele/commandeBD.php");
	$Commandes = commandes();
	require ("./vue/utilisateur/commandes.tpl");
	
}

function edit_plat() {
	
	require ("modele/commandeBD.php");
	$tabPlat = edit();
	require ("./vue/utilisateur/plats.tpl");
	
}


?>
