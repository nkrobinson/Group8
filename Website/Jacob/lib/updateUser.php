<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require("../config.php");
    require("functions.php");


	$name = $_POST['name'];
	$email = $_POST['email'];
	
	if($user->updateDetails(array(":name"=>$name, ":email"=>$email))){ 
		
		header('Content-Type: application/json');
		echo json_encode([ 'success' => $user->updateNodes($_POST['nodes']) ]);
	
	} else {
		header('Content-Type: application/json');
		echo json_encode([ 'error' => false ]);
	}
}
?>
