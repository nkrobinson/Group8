<?php
require("config.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spacetree - SpaceTree with on-demand nodes</title>

<!-- CSS Files -->
<link type="text/css" href="base.css" rel="stylesheet" />
<link type="text/css" href="Spacetree.css" rel="stylesheet" />

<!--[if IE]><script language="javascript" type="text/javascript" src="Jit/Extras/excanvas.js"></script><![endif]-->

<script language="javascript" type="text/javascript" src="Jit/jit.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script language="javascript" type="text/javascript" src="Project.js?<?php echo time(); ?>"></script>
<script>
//GET ALL PARENT-CHILD relations
/*$.ajax({
	url: "lib/api.php",
	type: "POST",
	data: {
		type:1,
		university:1
	},
	dataType: "JSON",
	success: function (jso) {
		//CHECK IN INSPECT ELEMENTS WHAT IS RETURNED
		console.log(jso);
		$('body').append("<br><br>ALL RELATIONS<br>");
		$('body').append(jso.id+": "+jso.name+" -> children: ");
		getChildes(jso.children)
	}
});
function getChildes(jso){
	if(typeof jso!=="undefined"){
		var str="";
		for(var i = 0; i < jso.length; i++) {
			var obj = jso[i];
				$('body').append( obj.id+": "+obj.name+" -> children: "+getChildes(obj.children));
				$('body').append( "<br>");
		}
	}else
		$('body').append( "<br>");
}*/
$(document).ready(function(e) {
    getStart();
});
</script>
</head>
  
<body>
<div class="loader"></div>

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
