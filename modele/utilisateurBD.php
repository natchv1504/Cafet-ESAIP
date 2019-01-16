<?php
// verif_bd : fonction booléenne. 
// Si vraie, alors profil de l'utilisateur affecté en sortie à $profil
function verif_bd($login, $pass, &$profil ) {
	
	require ("modele/connectBD.php") ; //connexion $link à MYSQL et sélection de la base
	
	$log = mysqli_real_escape_string($link, $login);
	$pswd = mysqli_real_escape_string($link, $pass);

	$res = mysqli_query($link, "SELECT login from admin where login='$log' and password='$pswd'")	
		or die (utf8_encode("erreur de requête")); 
		
	if (mysqli_num_rows ($res) > 0) {
		$profil = mysqli_fetch_assoc($res);
		return true;
	} 
	else {
		$profil = null;
		return false;
	}
}

?>