<!doctype html>
<html><head>
  <meta charset="utf-8">
  <meta http-equiv="pragma" content="no-cache" />
  <title>Editer les plats</title>
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

<h2> Editer les plats :</h2>
<div id="content">
<?php 
	if ($tabPlat) {	
		echo ("<table><tr><th>Nom du plat</th><th>Prix</th><th>Prix Menu</th></tr>");
		foreach ($tabPlat as $plat) {
		 	$id = utf8_encode($plat["id"]);
			echo ('<tr id="' . $id .'"><td><input type="text" value="' . utf8_encode($plat["nomPlat"]) . '"/></td>');
			echo ('<td><input type="text" value="' . utf8_encode($plat["prix"]) . '"/></td>');
			echo ('<td><input type="text" value="' . utf8_encode($plat["prixMenu"]) . '"/></td>');
			echo ('<td><div class="logoEdit"><img class="edit" id="' . $id .'" style="width:20px" src="./vue/images/editButton.png"></div><div id="check' . $id .'" class="logoCheck"><img style="width:20px" src="./vue/images/check.png"></div></td></tr>');
		}
		echo ("</table>");
	}

?>
</div>

<footer>
	<p> Vous êtes connecté en tant que <?php echo ($_SESSION['profil']['login']) ;?></p>
</footer>

</body></html>