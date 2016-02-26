<?php
ob_start();
session_start();

//Mysql stuff
$db_host = "localhost";
$db_user = "u385662700_hwu";
$db_db = "u385662700_hwu";
$db_pass = "@rlcgqeS?[+x";

date_default_timezone_set('Europe/London');

//application address
define('DIR','http://whisk.esy.es/Tryouts/Jacob/');
define('SITEEMAIL','noreply@whisk.esy.es');

try {

	//create PDO connection
	$pdo = new PDO("mysql:host=".$db_host.";dbname=".$db_db, $db_user, $db_pass);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch(PDOException $e) {
	//show error
    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
    exit;
}

//include the user class, pass in the database connection
include('lib/user.php');
include('lib/phpmailer/mail.php');
$user = new User($pdo);
?>