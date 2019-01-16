<!doctype html>
<html><head>
  <meta charset="utf-8">
  <title>Cafet'ESAIP</title>
  <link rel="icon" type="image/png" href="vue/images/logo/ms-icon-310x310.png" />
  <link rel="stylesheet" href="./vue/styleCSS/utilisateur.css"/>
  <!-- <script src="script.js"></script> -->
</head>

<body>
  <form action="index.php?controle=utilisateur&action=ident" method="post">
       <label>Login :</label>
  	 <input name="login" class="login"
              value="<?php echo $login ?>" /> 
       <label>Mot de passe :</label>
  	 <input type="password" name="pass" class="pass"
              value="<?php echo $pass ?>" />
       <input type= "submit" value= "Submit" /> 	 
  </form>
  <div id ="m"> <?php echo $msg; ?> </div>
</body></html>
