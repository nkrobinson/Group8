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
