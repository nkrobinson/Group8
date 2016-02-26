<?php
require('config.php');

//collect values from the url
$memberID = trim($_GET['x']);
$active = trim($_GET['y']);

//if id is number and the active token is not empty carry on
if(is_numeric($memberID) && !empty($active)){

	//update users record set the active column to Yes where the memberID and active value match the ones provided in the array
	$stmt = $pdo->prepare("UPDATE USERLIST SET active = 'Yes' WHERE userID = :userID AND active = :active");
	$stmt->execute(array(
		':userID' => $memberID,
		':active' => $active
	));

	//if the row was updated redirect the user
	if($stmt->rowCount() == 1){

		//redirect to login page
		header('Location: index.php');
		exit;

	} else {
		echo "Your account could not be activated."; 
	}
	
}
?>