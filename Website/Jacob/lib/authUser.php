<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require("../config.php");
    require("functions.php");

    $pdo = conn();
	
	if(isset($_POST['type']) && $_POST['type']==1)
    	$query = $pdo->prepare("SELECT * FROM USERLIST WHERE username = :user");
	else if(isset($_POST['type']) && $_POST['type']==2)
    	$query = $pdo->prepare("SELECT * FROM USERLIST WHERE username = :user AND password = :pass");
	
	$query->bindParam(":user", $_POST['name']);
	if(isset($_POST['type']) && $_POST['type']==2)
		$query->bindParam(":pass", $_POST['pass']);

	$query->execute();
	$data = $query->fetchAll(PDO::FETCH_ASSOC);

    if (!$data && $_POST['type']==1) {
		
		$query = $pdo->prepare("INSERT INTO USERLIST (username, password) VALUES (:name, :pass)");
		$query->bindParam(":name", $_POST['name']);
		$query->bindParam(":pass", $_POST['pass']);
		$query->execute();
		
		$_SESSION['username']=$_POST['name'];
		$_SESSION['password']=$_POST['pass'];

		header('Content-Type: application/json');
        echo json_encode([ 'success' => true ]);
    } else if($_POST['type']==2 && $data) {
		$_SESSION['username']=$_POST['name'];
		$_SESSION['password']=$_POST['pass'];
		header('Content-Type: application/json');
        echo json_encode([ 'success' => true ]);
    }else{
		header('Content-Type: application/json');
        echo json_encode([ 'error' => false ]);
	}
}
?>
