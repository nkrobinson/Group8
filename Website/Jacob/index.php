<?php
require("config.php");
require("lib/functions.php");
$page="home";
if(isset($_GET['page']) && $_GET['page']!="home"){
	if($_GET['page']=="logout")
	{
		$user->logout(); 	
	}else
		$page=$_GET['page'];
}

if($page!="home" && !$_SESSION['loggedin'])
	header("Location: home");

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Hotel Whisky project</title>

<!-- CSS Files -->
<link href='//fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<link type="text/css" href="css/base.css" rel="stylesheet" />
<link type="text/css" href="css/Spacetree.css" rel="stylesheet" />

<!--[if IE]><script language="javascript" type="text/javascript" src="Jit/Extras/excanvas.js"></script><![endif]-->

<script language="javascript" type="text/javascript" src="js/Jit/jit.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script language="javascript" type="text/javascript" src="js/Project.js?<?php echo time(); ?>"></script>
<script language="javascript" type="text/javascript" src="js/User.js?<?php echo time(); ?>"></script>
<script>
$(document).ready(function(e) {
    getStart();
});
</script>
</head>
<body>
<div class="loader"></div>
<!-- HEADER PART -->
<div class="navigation"><?php if($user->is_logged_in()) echo "<u onclick='userOpen()' style='cursor:pointer;'>".$_SESSION['username']."</u>"; else{ ?><u onclick="regOpen()">Register</u> | <u onclick="logOpen()">Login</u><?php } ?></div>
<div class="userMenu">
	<?php if($page!="home"){ ?><a href="home"><div class="line">Home</div></a><?php } ?>
	<?php if($page!="profile"){ ?><a href="profile"><div class="line">My Profile</div></a><?php } ?>
	<div class="line" onclick="logOut()">Logout</div>
</div>
<div class="regForm">
	<div class="main-form">
        <input type="text" maxlength="50" class="name" placeholder="Username" /><br />
        <input type="email" maxlength="120" class="email" placeholder="Email" /><br />
        <input type="password" maxlength="20" class="pass" placeholder="Password" /><br />
        <input type="password" maxlength="20" class="r-pass" placeholder="Repeat Password" /><br /><br />
        <input type="submit" onclick="authUser(1)" />
    </div>
    <div class="confirmation">You registered successfully! Activation email will arrive shortly.</div>
</div>
<div class="logForm">
    <input type="text" maxlength="50" class="name" placeholder="Username" /><br />
    <input type="password" maxlength="20" class="pass" placeholder="Password" /><br /><br />
    <div class="confirmation" style="color:#B0080B">Sorry your details are wrong or account not activated.</div>
    <input type="submit" onclick="authUser(2)" />
</div>
<!-- END HEADER PART -->
<div id="container">
	<?php if($page=="home"){ ?>
        <div class="selection">
        
        </div>
        <div id="center-container">
            <div id="infovis"></div>    
        </div>
        <div class="selected-node"></div>
        
        <div id="log"></div>
    <?php }else if($page=="profile"){ 
		$user_details=$user->details();
		$user_node=$user->nodes(); ?>
    	<input type="text" maxlength="100" class="name" placeholder="Full Name" style="margin-top:200px;" value="<?php echo $user_details['name']; ?>" /><br />
    	<input type="text" maxlength="100" class="email" placeholder="Email" value="<?php echo $user_details['email']; ?>" /><br />
    	<select class="university">
        	<option value="">University</option>
            <?php
				$sql = getNodes(3);
				foreach ($sql as $row) 
					echo "<option value='".$row['nodeID']."' data='".in_array($row['nodeID'], $user_node)." ".$row['nodeID']."' ".((in_array($row['nodeID'], $user_node))?"selected='selected'":"").">".$row['name']."</option>";
				?>
        </select><br />
    	<select class="discipline">
        	<option value="">Discipline</option>
            <?php
				$sql = getNodes(1);
				foreach ($sql as $row) 
					echo "<option value='".$row['nodeID']."'  ".((in_array($row['nodeID'], $user_node))?"selected='selected'":"").">".$row['name']."</option>";
				?>
        </select><br /><br />
        <div style="color:#1A5E15; font-size:14px; text-align:center; width:100%;" class="succ"></div>
        <input type="submit" onclick="updateProfile()" />
    <?php } ?>
</div>
</body>
</html>
