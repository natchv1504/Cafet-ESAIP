<!doctype html>
<html><head>
  <meta charset="utf-8">
  <meta http-equiv="pragma" content="no-cache" />
  <title>Récapitulatif des commandes</title>
  <link rel="icon" type="image/png" href="vue/images/logo/ms-icon-310x310.png" />
  <link rel="stylesheet" href="./vue/styleCSS/utilisateur.css"/>
  <!-- <script src="script.js"></script> -->
</head>

<body>

<header>
	<nav class='menu'>
		<?php require ("vue/menu.tpl");?>
	</nav>
</header>

<div id="main">
<?php 
	if ($Commandes != false) {
		echo ("<h2> Voici les commandes :</h2>");	
		foreach ($Commandes as $c) {
			$numCo = utf8_encode($c['NumeroCommande']);
			echo "<div class='divCom'><div class='commande' id='". $numCo . "'>";
			echo ("<h3>" . $numCo . "</h3>"); 
			echo ("<p>" . utf8_encode($c['Login']) . "</p>"); 
			echo ("<p>" . utf8_encode($c['Prix']) . " €</p>");
			echo ("<p>" . utf8_encode($c['Description']) . "</p>");
			echo ("<p>" . utf8_encode($c['Date']) . "</p>"); 
			echo "</tr></div><div class='valider'><p>Valider</p></div></div>\n";
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
