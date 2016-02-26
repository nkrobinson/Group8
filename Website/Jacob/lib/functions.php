<?php
function conn()
{
	global $db_host, $db_db, $db_user, $db_pass;

	$pdo = new PDO('mysql:host='.$db_host.';dbname='.$db_db, $db_user, $db_pass);
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	return $pdo;
}
function getNodes($id){
	global $pdo;
	
	$query=$pdo->prepare("SELECT nodeID, name FROM NODELIST WHERE typeID=:id");
	$query->bindParam(":id", $id);		
	$query->execute();
	
	$sql = $query->fetchAll(PDO::FETCH_ASSOC);
	return $sql;
}
?>