<?php
include('../config.php');
require("functions.php");

//Starting fun
function getChild($id){
	global $pdo;
	$child=array();
			
	$query = $pdo->prepare("SELECT
			rl.childID as 'child_id',
			(SELECT nl.typeID FROM NODELIST nl WHERE child_id=nl.nodeID) as 'type',
			(SELECT nl.name FROM NODELIST nl WHERE child_id=nl.nodeID) AS 'child'
		FROM
			NODERELATIONLIST rl,
			NODELIST nl
		WHERE 
			rl.parentID=:id AND
			nl.nodeID = rl.parentID");
	$query->bindParam(":id", $id);
	$query->execute();
	
	$sqla = $query->fetchAll(PDO::FETCH_ASSOC);
	
	foreach ($sqla as $row) {
		if($row['type']!=4) {
			$child[] = array('id' => $row['child_id'], 'name' => $row['child'], 'type' => $row['type'], "data"=>array(), "children"=>getChild($row['child_id']));
			
		}
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
			nl.typeID as 'type',
			(SELECT nl.name FROM NODELIST nl WHERE child_id=nl.nodeID) AS 'child',
			(SELECT rld.description FROM NODEDESCRIPTIONLIST rld WHERE child_id=rld.nodeID) AS 'desc'
		FROM
			NODERELATIONLIST rl,
			NODEDESCRIPTIONLIST rld,
			NODELIST nl
		WHERE 
			rl.parentID=:id AND
			nl.nodeID = rl.parentID");
		$query->bindParam(":id", $_POST['id']);
					
		$query->execute();
		
		$sql = $query->fetchAll(PDO::FETCH_ASSOC);
		$json=array();
		foreach ($sql as $row) {
			$name = $row['child'];
			$pattern = '/((?:(?!\sat\s).)+)(\sat\s)(.+)/s';
			$replace = '$3';
			$name = preg_replace($pattern, $replace, $name);
			$json[]=array("name"=>$name, "id"=>$row['child_id'], "description"=>$row['desc'], "type"=>$row['type']);
		}
		header('Content-Type: application/json');
		echo json_encode($json);
		
	}
}
?>
