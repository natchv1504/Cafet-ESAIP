<?php 

function ident () {

	$login=isset($_POST['login'])?trim($_POST['login']):'';
	$pass=isset($_POST['pass'])?trim($_POST['pass']):'';
	$msg="";
	
	require ("./modele/utilisateurBD.php");

	if(count($_POST)==0){
		require("vue/utilisateur/ident.tpl");
	}
	else {		
		if (/*verif_ident($login, $pass, $err) &&*/ verif_bd($login, $pass, $profil)) {
			$_SESSION['profil'] = $profil;
			$nexturl = "index.php?controle=commande&action=liste_commandes";
			header ("Location:" . $nexturl);
			//echo ('controle : ' . $controle . ' et <br/> action : ' . $action);	
			require ('./controle/commande.php');
			$action ();
		}
		else {
			//$msg = $err;
			$msg = "Login ou/et Mot de passe non valide";
			require("vue/utilisateur/ident.tpl");
		}
	}
}

// vérification saisies
// chaîne non vide de 30 caractères max
// Si erreur, info retournée dans $err 
function verif_ident($login, $pass, &$err) {
	if ((preg_match(" /([^A-Za-z])/ ", $login)) && (preg_match(" /([^A-Za-z0-9])/ ", $pass))) {
		return true;
	}
	else {
		$err = 'erreur de syntaxe sur le login ou le mot de passe';
		return false;
	}	
}


function logout(){
	session_unset();
	session_destroy();
	$pass = '';$login = '';$msg = '';
	require("vue/utilisateur/ident.tpl");
}

function edit(){

}