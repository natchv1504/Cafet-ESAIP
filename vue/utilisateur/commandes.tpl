<!doctype html>
<html><head>
  <meta charset="utf-8">
  <title>Récapitulatif des commandes</title>
  <link rel="icon" type="image/png" href="vue/images/logo/ms-icon-310x310.png" />
  <link rel="stylesheet" href="./vue/styleCSS/style.css"/>
  <link rel="stylesheet" href="./vue/styleCSS/utilisateur.css"/>
  <link rel="stylesheet" href="./vue/styleCSS/contact.css"/>
  <!-- <script src="script.js"></script> -->
</head>

<body>

<nav>
	<?php require ("vue/menu.tpl");?>
</nav>

<h1 style="padding-bottom:5%"> Vous êtes connecté en tant que <?php echo ($_SESSION['profil']['login']) ;?>
</h1>

<div id="main">
<?php 
	if ($Commandes != false) {
		echo ("<h2 style='color:blue'> Voici les commandes :</h2>");
		echo ('<table>');	
		foreach ($Commandes as $c) {
			echo "<tr class='commande'>";
			echo ("<td>" . utf8_encode($c['numCo']) . "</td>"); 
			echo ("<td>" . utf8_encode($c['log']) . "</td>"); 
			echo ("<td>" . utf8_encode($c['prix']) . "</td>");
			echo ("<td>" . utf8_encode($c['date']) . "</td>"); 
			echo "</tr>\n";
		}
		echo ('</table>');
	}
	else 
		echo ('Pas de commande pour le moment');
?>
</div>

</body></html>
