<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require("../config.php");
    require("functions.php");

    $pdo = conn();

    $query = $pdo->prepare("SELECT * FROM users WHERE uid = :uid AND week = :week");
	$query->bindParam(":uid", $_POST['uid']);
    $query->bindParam(":week", $_POST['week']);
	$query->execute();
	$data = $query->fetchAll(PDO::FETCH_ASSOC);

    if (!$data) {
        echo json_encode([ 'success' => true ]);
    } else {
        echo json_encode([ 'success' => false ]);
    }
}
?>
