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
	
	$query=$pdo->prepare("SELECT nodeID, name FROM NODELIST WHERE typeID=:id ORDER BY name ASC");
	$query->bindParam(":id", $id);		
	$query->execute();
	
	$sql = $query->fetchAll(PDO::FETCH_ASSOC);
	return $sql;
}
function getSQA(){
	global $pdo;
	
	$query=$pdo->prepare("SELECT sqaID, name FROM SQALIST ORDER BY name ASC");	
	$query->execute();
	
	$sql = $query->fetchAll(PDO::FETCH_ASSOC);
	return $sql;
}
function getGrades(){
	global $pdo;
	
	$query=$pdo->prepare("SELECT * FROM QUALIFICATIONLIST ORDER BY name ASC, grade");	
	$query->execute();
	
	$sql = $query->fetchAll(PDO::FETCH_ASSOC);
	return $sql;
}
?>