<!doctype html>
<html><head>
  <meta charset="utf-8">
  <meta http-equiv="pragma" content="no-cache" />
  <title>Récapitulatif des commandes</title>
  <link rel="icon" type="image/png" href="vue/images/logo/ms-icon-310x310.png" />
  <link rel="stylesheet" href="./vue/styleCSS/utilisateur.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script type="text/javascript" src="./Js/actions.js"></script>
</head>

<body>

<header>
	<nav class='menu'>
		<?php require ("vue/menu.tpl");?>
	</nav>
</header>

<h2> Voici les commandes :</h2>
<div id="main">
<?php 
	if ($Commandes != false) {	
		foreach ($Commandes as $c) {
			$numCo = utf8_encode($c['NumeroCommande']);
			echo "<div class='divCom' id='". $numCo . "'><div class='commande'>";
			echo ("<div id='headCo'><div id='num'>" . $numCo . "</div><div id='prix'>" . utf8_encode($c['Prix']) . " €</div></div>");
			echo ("<p style='font-weight:bold'>" . utf8_encode($c['Description']) . "</p>");
			echo ("<div id='footCo'><p>" . utf8_encode($c['Login']) . "</p>");
			echo ("<p>" . utf8_encode($c['Date']) . "</p></div>"); 
			echo "</tr></div><div class='valider'><img src='./vue/images/check.png'></div></div>\n";
		}
	}
	else 
		echo ('Pas de commande pour le moment');
?>
</div>

<footer>
	<p> Vous êtes connecté en tant que <?php echo ($_SESSION['profil']['login']) ;?></p>
</footer>

</body></html>
