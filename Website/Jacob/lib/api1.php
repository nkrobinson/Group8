<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include('../config.php');
require("functions.php");

function getChild($id, $type){
	//$type - is child or parent
	// 1-child, 2 parent
	global $pdo;
	$child=array();
	$end="rl.parentID=:id AND
			nl.nodeID = rl.parentID";
	if($type==1)
		$end="rl.childID=:id AND
			nl.nodeID = rl.parentID";
	$query = $pdo->prepare("SELECT
			rl.".(($type==1)?"parentID":"childID")." as 'child_id',
			(SELECT nl.typeID FROM NODELIST nl WHERE child_id=nl.nodeID) as 'type',
			(SELECT nl.name FROM NODELIST nl WHERE child_id=nl.nodeID) AS 'child'
		FROM
			NODERELATIONLIST rl,
			NODELIST nl
		WHERE 
			".$end);
	$query->bindParam(":id", $id);
	$query->execute();
	
	$sqla = $query->fetchAll(PDO::FETCH_ASSOC);
	
	foreach ($sqla as $row) {
			$child[] = array('id' => $row['child_id'], 'name' => $row['child'], 'type' => $row['type'], "data"=>array(), "children"=>array());
	}
	
	return $child;
}

if($_SERVER['REQUEST_METHOD'] === 'GET'){
	//GET UNIVERSITIES courses
	if(isset($_GET['university_id']) || isset($_GET['university_name'])){
		if(empty($_GET['university_id'])){
			$uni=$_GET['university_name'];
			$query = $pdo->prepare("SELECT nodeID, name, typeID FROM NODELIST WHERE name LIKE ? AND typeID=3");
			$var = array("%$uni%");
			$query->execute($var);
		}
		
		if(empty($_GET['university_name'])){
			$uni=$_GET['university_id'];
			$query = $pdo->prepare("SELECT nodeID, name, typeID FROM NODELIST WHERE nodeID=:id AND typeID=3");
			$query->bindParam(":id", $uni);
			$query->execute();
		}
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		$parent=array();
		foreach ($sql as $row) 
			$parent[]=array("name"=>$row['name'], "id"=>$row['nodeID'], "data"=>array(), "children"=>getChild($row['nodeID'], 1));
		
		header('Content-Type: application/json');
		echo json_encode($parent);
	}
	if(isset($_GET['course_id']) || isset($_GET['course_name'])){
		if(empty($_GET['course_id'])){
			$uni=$_GET['course_name'];
			$query = $pdo->prepare("SELECT nodeID, name, typeID FROM NODELIST WHERE name LIKE ? AND typeID=2");
		$var = array("%$uni%");
		$query->execute($var);
		}
		
		if(empty($_GET['course_name'])){
			$uni=$_GET['course_id'];
			$query = $pdo->prepare("SELECT nodeID, name, typeID FROM NODELIST WHERE nodeID=:id AND typeID=2");
			$query->bindParam(":id", $uni);
			$query->execute();
		}
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		
		$parent=array();
		foreach ($sql as $row) 
			$parent[]=array("name"=>$row['name'], "id"=>$row['nodeID'], "data"=>array(), "children"=>getChild($row['nodeID'], 2));
		
		header('Content-Type: application/json');
		echo json_encode($parent);
	}
}
?>