<?php
include('../config.php');
require("functions.php");

//CONNECT MYSQL
$pdo = conn();
//Starting fun
function getChild($id){
	global $pdo;
	$child=array();
			
	$query = $pdo->prepare("SELECT
			rl.childID as 'child_id',
			nl.typeID as 'type',
			(SELECT nl.name FROM NODELIST nl WHERE child_id=nl.nodeID) AS 'child'
		FROM
			RELATIONLIST rl,
			NODELIST nl
		WHERE 
			rl.parentID=:id AND
			nl.nodeID = rl.parentID");
	$query->bindParam(":id", $id);
	$query->execute();
	
	$sqla = $query->fetchAll(PDO::FETCH_ASSOC);
	
	foreach ($sqla as $row) {
		if($row['child_id']<12)
			$child[] = array('id' => $row['child_id'], 'name' => $row['child'], "data"=>array(), "children"=>getChild($row['child_id']));
	}
	
	return $child;
}

if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['type'])){
	if($_POST['type']==1 && isset($_POST['university'])){
		
		$uni=$_POST['university'];
		$query = $pdo->prepare("SELECT nl.name FROM NODELIST nl WHERE nl.nodeID=:id");
					
		$query->bindParam(":id", $uni);
		$query->execute();
		
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		
		foreach ($sql as $row) 
			$parent=array("name"=>$row['name'], "id"=>$uni, "data"=>array(), "children"=>getChild($uni));
		
		header('Content-Type: application/json');
		echo json_encode($parent);
	}else if($_POST['type']==2){
		
		$query = $pdo->prepare("SELECT nl.name, nl.nodeID FROM NODELIST nl WHERE nl.typeID=1");
					
		$query->execute();
		
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		$json=array();
		foreach ($sql as $row) 
			$json[]=array("name"=>$row['name'], "id"=>$row['nodeID']);
		
		header('Content-Type: application/json');
		echo json_encode($json);
		
	}else if($_POST['type']==3){
		
		$query = $pdo->prepare("SELECT
			rl.childID as 'child_id', rl.relationID as 'rel_id',
			(SELECT nl.name FROM NODELIST nl WHERE child_id=nl.nodeID) AS 'child',
			(SELECT description FROM RELATIONDESCRIPTION WHERE rel_id=relationID) AS 'desc'
		FROM
			RELATIONLIST rl,
			NODELIST nl
		WHERE 
			rl.parentID=:id AND
			nl.nodeID = rl.parentID");
		$query->bindParam(":id", $_POST['id']);
					
		$query->execute();
		
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		$json=array();
		foreach ($sql as $row) 
			$json[]=array("name"=>$row['child'], "id"=>$row['child_id'], "description"=>$row['desc']);
		
		header('Content-Type: application/json');
		echo json_encode($json);
		
	}
}
?>