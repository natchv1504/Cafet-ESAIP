<?php

$hote="localhost";   		
$log="root";  		
$password=""; 			
$bd="id7260831_cafetesaip"; 

if (!isset($link)) {
$link = mysqli_connect($hote, $log, $password) 
		or die ("erreur de connexion :" . mysql_error()); 
mysqli_select_db($link, $bd) 
		or die (htmlentities("erreur d'accès à la base :") . $bd);
}
?>