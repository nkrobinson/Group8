<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require("../config.php");
    require("functions.php");

	if(isset($_POST['type'])){
		if($_POST['type']==1){
			$name = $_POST['name'];
			$email = $_POST['email'];
			
			if($user->updateDetails(array(":name"=>$name, ":email"=>$email))){ 
				
				header('Content-Type: application/json');
				echo json_encode([ 'success' => $user->updateNodes($_POST['nodes']) ]);
			
			} else {
				header('Content-Type: application/json');
				echo json_encode([ 'error' => false ]);
			}
		}else if($_POST['type']==2){
			$sqa = $_POST['subject'];
			$grade = $_POST['grade'];
			$tr = $user->insertGrade($sqa, $grade);
			if(isset($tr['id'])){ 
				
				header('Content-Type: application/json');
				echo json_encode([ 'success' => true, 'id'=>$tr['id'] ]);
			
			} else {
				header('Content-Type: application/json');
				echo json_encode([ 'error' => false, 'problem'=>$tr ]);
			}
			
		}else if($_POST['type']==3){
			$id = $_POST['id'];
			$tr = $user->deleteGrade($id);
			if($tr){ 
				
				header('Content-Type: application/json');
				echo json_encode([ 'success' => true]);
			
			} else {
				header('Content-Type: application/json');
				echo json_encode([ 'error' => false]);
			}
			
		}
	}
}
?>
