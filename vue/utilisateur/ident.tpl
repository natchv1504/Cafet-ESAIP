<!doctype html>
<html><head>
  <meta charset="utf-8">
  <meta http-equiv="pragma" content="no-cache" />
  <title>Cafet'ESAIP</title>
  <link rel="icon" type="image/png" href="vue/images/logo/ms-icon-310x310.png" />
  <link rel="stylesheet" href="./vue/styleCSS/utilisateur.css"/>
  <!-- <script src="script.js"></script> -->
</head>

<body>
  <form class='loginForm' action="index.php?controle=utilisateur&action=ident" method="post">
    <img id='logo' src="vue/images/logo/ms-icon-310x310.png" alt="logo">
  	 <input name="login" class="login" placeholder="Login" autofocus
            value="<?php echo $login ?>" /> 
  	 <input type="password" name="pass" class="pass" placeholder="Mot de passe" 
            value="<?php echo $pass ?>" />
      <input type= "submit" value= "Submit" class="login-button"/> 
      <div id ="m"> <?php echo $msg; ?> </div>	 
  </form>
</body></html>
