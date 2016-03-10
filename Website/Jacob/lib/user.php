<?php
include('password.php');
class User extends Password{

    private $_db;

    function __construct($db){
    	parent::__construct();

    	$this->_db = $db;
    }

	private function get_user_hash($username){

		try {
			$stmt = $this->_db->prepare('SELECT password, username, userID FROM USERLIST WHERE username = :username AND active="Yes" ');
			$stmt->execute(array('username' => $username));

			return $stmt->fetch();

		} catch(PDOException $e) {
		    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
		}
	}

	public function details(){

		try {
			if($_SESSION['loggedin']){
				$stmt = $this->_db->prepare('SELECT * FROM USERLIST WHERE userID = :username AND active="Yes" ');
				$stmt->execute(array('username' => $_SESSION['userID']));
	
				return $stmt->fetch();
			}

		} catch(PDOException $e) {
		    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
		}
	}

	public function nodes(){

		try {
			if($_SESSION['loggedin']){
				$arr=array();
				$stmt = $this->_db->prepare('SELECT udl.nodeID FROM USERLIST ul , USERNODELIST udl WHERE ul.userID = :username AND udl.userID=ul.userID');
				$stmt->execute(array('username' => $_SESSION['userID']));
				
				$sqla = $stmt->fetchAll(PDO::FETCH_ASSOC);
				
				foreach ($sqla as $row)
					$arr[]=$row['nodeID'];
	
				return $arr;
			}

		} catch(PDOException $e) {
		    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
		}
	}

	public function grades(){

		try {
			if($_SESSION['loggedin']){
				$arr=array();
				$stmt = $this->_db->prepare('SELECT g.gradeID as "id", sqa.name as "sqa", qual.name as "qual", qual.grade, qual.points FROM GRADELIST g, SQALIST sqa, QUALIFICATIONLIST qual WHERE g.userID = :username AND g.qualID=qual.qualID AND g.sqaID=sqa.sqaID');
				$stmt->execute(array('username' => $_SESSION['userID']));
				
				$sqla = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
				return $sqla;
			}

		} catch(PDOException $e) {
		    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
		}
	}

	public function countUcas(){

		try {
			if($_SESSION['loggedin']){
				$stmt = $this->_db->prepare('SELECT sum(qual.points) as "points" FROM GRADELIST g, QUALIFICATIONLIST qual WHERE g.userID = :username AND g.qualID=qual.qualID');
				$stmt->execute(array('username' => $_SESSION['userID']));
				
				$sqla = $stmt->fetchAll(PDO::FETCH_ASSOC);
				$arr=0;
				if($sqla){
					foreach ($sqla as $row){
						if($row['points']!==NULL)
							$arr=$row['points'];
					}
				}
				return $arr;
			}

		} catch(PDOException $e) {
		    echo '<p class="bg-danger">'.$e->getMessage().'</p>';
		}
	}

	public function updateDetails($arr){

		try {
			if($_SESSION['loggedin']){
				$stmt = $this->_db->prepare('UPDATE USERLIST SET name=:name , email=:email  WHERE userID = :username');
				$stmt->execute(array_merge(array('username' => $_SESSION['userID']), $arr));
	
				return true;
			}

		} catch(PDOException $e) {
		    return false;
		}
	}

	public function updateNodes($arr){

		try {
			if($_SESSION['loggedin']){
				$stmt = $this->_db->prepare('DELETE FROM  USERNODELIST WHERE userID=:username');
				$stmt->execute(array('username' => $_SESSION['userID']));
				for($i=0;$i<count($arr);$i++){
					$node=$arr[$i];
					if(strlen($node)>0){
						$stmt = $this->_db->prepare('INSERT INTO  USERNODELIST SET nodeID=:node , userID=:username');
						$stmt->execute(array('username' => $_SESSION['userID'], "node"=>$node));
					}
				}
	
				return $arr;
			}

		} catch(PDOException $e) {
		    return false;
		}
	}

	public function insertGrade($node, $qual){

		try {
			if($_SESSION['loggedin']){
				if(!empty($node) && !empty($qual)){
					//sqaID - maths and etc, qualID - higher grade 1.
					$stmt = $this->_db->prepare('INSERT INTO  GRADELIST SET sqaID=:node, qualID=:qual, userID=:username');
					$stmt->execute(array('username' => $_SESSION['userID'], "node"=>$node, "qual"=>$qual));
					return array("id"=>$this->_db->lastInsertId());
				}
	
				return array("error"=>"details are wrong");
			}

		} catch(PDOException $e) {
		    return false;
		}
	}

	public function deleteGrade($id){

		try {
			if($_SESSION['loggedin']){
				if(!empty($id)){
					//sqaID - maths and etc, qualID - higher grade 1.
					$stmt = $this->_db->prepare('DELETE FROM  GRADELIST WHERE gradeID=:qual AND userID=:username');
					$stmt->execute(array('username' => $_SESSION['userID'], "qual"=>$id));
					return true;
				}
	
				return false;
			}

		} catch(PDOException $e) {
		    return false;
		}
	}

	public function login($username,$password){

		$row = $this->get_user_hash($username);

		if($this->password_verify($password,$row['password']) == 1){

		    $_SESSION['loggedin'] = true;
		    $_SESSION['username'] = $row['username'];
		    $_SESSION['userID'] = $row['userID'];
		    return true;
		}
	}

	public function logout(){
		session_destroy();
	}

	public function is_logged_in(){
		if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true){
			return true;
		}
	}

}


?>
