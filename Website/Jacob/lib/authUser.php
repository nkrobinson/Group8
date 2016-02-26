<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require("../config.php");
    require("functions.php");


	if(isset($_POST['type']) && $_POST['type']==1)
	{
		//very basic validation
		if(strlen($_POST['username']) < 3){
			$error[] = 'Username is too short.';
		} else {
			$stmt = $pdo->prepare('SELECT username FROM USERLIST WHERE username = :username');
			$stmt->execute(array(':username' => $_POST['username']));
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
			if(!empty($row['username'])){
				$error[] = 'Username provided is already in use.';
			}
	
		}
	
		if(strlen($_POST['password']) < 3){
			$error[] = 'Password is too short.';
		}
	
		if(strlen($_POST['passwordConfirm']) < 3){
			$error[] = 'Confirm password is too short.';
		}
	
		if($_POST['password'] != $_POST['passwordConfirm']){
			$error[] = 'Passwords do not match.';
		}
	
		//email validation
		if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
			$error[] = 'Please enter a valid email address';
		} else {
			$stmt = $pdo->prepare('SELECT email FROM USERLIST WHERE email = :email');
			$stmt->execute(array(':email' => $_POST['email']));
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
			if(!empty($row['email'])){
				$error[] = 'Email provided is already in use.';
			}
	
		}
	
	
		//if no errors have been created carry on
		if(!isset($error)){
	
			//hash the password
			$hashedpassword = $user->password_hash($_POST['password'], PASSWORD_BCRYPT);
	
			//create the activasion code
			$activasion = md5(uniqid(rand(),true));
	
			try {
	
				//insert into database with a prepared statement
				$stmt = $pdo->prepare('INSERT INTO USERLIST (username,password,email,active) VALUES (:username, :password, :email, :active)');
				$stmt->execute(array(
					':username' => $_POST['username'],
					':password' => $hashedpassword,
					':email' => $_POST['email'],
					':active' => $activasion
				));
				$id = $pdo->lastInsertId('userID');
	
				//send email
				$to = $_POST['email'];
				$subject = "User activation";
				$body = DIR."activate.php?x=$id&y=$activasion";
				$headers = 'From: '.SITEEMAIL . "\r\n" .
					'X-Mailer: PHP/' . phpversion();
	
				/*$mail = new Mail();
				$mail->setFrom(SITEEMAIL);
				$mail->addAddress($to);
				$mail->subject($subject);
				$mail->body($body);
				$mail->send();*/
				mail($to, $subject, $body, $headers);
				/*$url = 'http://tinypromos.com/development/hwu/mailopa.php';
				$data = array('to' => $to, 'subject' => $subject, 'body'=>$body, 'email'=>SITEEMAIL);
				
				// use key 'http' even if you send the request to https://...
				$options = array(
					'http' => array(
						'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
						'method'  => 'POST',
						'content' => http_build_query($data),
					),
				);
				$context  = stream_context_create($options);
				$result = file_get_contents($url, false, $context);
				$g="g";*/
				
				header('Content-Type: application/json');
				echo json_encode([ 'success' => true ]);
				//redirect to index page
				
	
			//else catch the exception and show the error.
			} catch(PDOException $e) {
				$error[] = $e->getMessage();
				header('Content-Type: application/json');
				echo json_encode([ 'error' => $error ]);
			}
	
		}
		else{
			header('Content-Type: application/json');
			echo json_encode([ 'error' => $error ]);
		}
	}else{
		$username = $_POST['username'];
		$password = $_POST['password'];
		
		if($user->login($username,$password)){ 
			$_SESSION['username'] = $username;
			header('Content-Type: application/json');
			echo json_encode([ 'success' => true ]);
		
		} else {
			$error[] = 'Wrong username or password or your account has not been activated.';
			header('Content-Type: application/json');
			echo json_encode([ 'error' => $error ]);
		}
	}


    /*$pdo = conn();
	
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
	}*/
}
?>
