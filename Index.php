<?php 

session_start ();

if ((count($_GET)!=0) && !(isset($_GET['controle']) && isset ($_GET['action'])))
		require ('./vue/erreur404.tpl'); //cas d'un appel à index.php avec des paramètres incorrects
		
else {

	if ((! isset($_SESSION['profil'])) || count($_GET)==0)	{
		$controle = "utilisateur";   //personne non authentifiée
		$action=	"ident";		//ou appel à index.php sans paramètre
	}
	else {
		if (isset($_GET['controle']) && isset ($_GET['action'])) {
			$controle = $_GET['controle'];   //appel à index.php 
			$action = 	 $_GET['action'];	//avec 2 paramètres controle et action
		}
	}
	//echo ('controle : ' . $controle . ' et <br/> action : ' . $action);	
	require ('./controle/' . $controle . '.php');
	$action ();
} 

?>
