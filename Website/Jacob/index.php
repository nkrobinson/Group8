<?php
session_start();

require("config.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spacetree - SpaceTree with on-demand nodes</title>

<!-- CSS Files -->
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
<div class="navigation"><?php if(isset($_SESSION['username'])) echo $_SESSION['username']; else{ ?><u onclick="regOpen()">Register</u> | <u onclick="logOpen()">Login</u><?php } ?></div>
<div class="regForm">
    <input type="text" maxlength="50" class="name" placeholder="Username" /><br />
    <input type="password" maxlength="20" class="pass" placeholder="Password" /><br />
    <input type="submit" onclick="authUser(1)" />
</div>
<div class="logForm">
    <input type="text" maxlength="50" class="name" placeholder="Username" /><br />
    <input type="password" maxlength="20" class="pass" placeholder="Password" /><br />
    <input type="submit" onclick="authUser(2)" />
</div>
<div id="container">
    
    <div class="selection">
    
    </div>
    <div id="center-container">
        <div id="infovis"></div>    
    </div>
    <div class="selected-node"></div>
    
    <div id="log"></div>
</div>
</body>
</html>
