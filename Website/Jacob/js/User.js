/* ANIMATIONS */
function regOpen(){
	if($('.regForm').is(':visible')){
		$('.regForm').slideUp(300);
	}else{
		if($('.logForm').is(':visible')){
			$('.logForm').slideUp(300,function(){
				$('.regForm').slideDown(300);
			});
		}else
			$('.regForm').slideDown(300);
	}
}
function logOpen(){
	
	if($('.logForm').is(':visible')){
		$('.logForm').slideUp(300);
	}else{
		if($('.regForm').is(':visible')){
			$('.regForm').slideUp(300, function(){
				$('.logForm').slideDown(300);
			});
		}else
			$('.logForm').slideDown(300);
	}
}
function userOpen(){
	if($('.userMenu').is(':visible'))
		$('.userMenu').slideUp(300);
	else
		$('.userMenu').slideDown(300);
}
function logOut(){
	$('.userMenu').slideUp(300);
	$.get('logout',function(id){window.location.href="home"});
}
/* END ANIMATIONS */

/* USER REGISTRATION/LOGIN/UPDATE */
function authUser(id) {
        var message = "";

		var tmp=".regForm ";
		if(id==2)
			tmp=".logForm ";
        message += checkInput(tmp+".name", "Name");
		if(id==1)
	        message += checkInput(tmp+".email", "Email");
        message += checkInput(tmp+".pass", "Password");
		
		if(id==1)
	        message += checkInput(tmp+".r-pass", "Repeat Password");
		if(id==1){
			if(($(tmp+'.r-pass').val()!=$(tmp+'.pass').val()) || $(tmp+'.pass').val().length<1){
				$(tmp+'.r-pass, '+tmp+'.pass').addClass('error');
				message += "Passwords do not match";
			}else
				$(tmp+'.r-pass, '+tmp+'.pass').removeClass('error')
		}
        if (message == "") {
           	$.ajax({
				type: "POST",
				url: "lib/authUser.php",
				dataType: "json",
				data: {
					username: $(tmp+".name").val(),
					password: $(tmp+".pass").val(),
					passwordConfirm: $(tmp+".r-pass").val(),
					email: $(tmp+".email").val(),
					type:id
				}
			}).done(function(response) {
				console.log(response);
				if (response.success) {
					if(id==2){
						$('.navigation').html("<u onclick='userOpen()' style='cursor:pointer;'>"+$(tmp+".name").val()+"</u>");
						$('.logForm, .regForm').slideUp(300);
					}
					else{
						$(tmp+".main-form").fadeOut(300, function(){
							$(tmp+".confirmation").fadeIn(300);
							setTimeout(function(){$('.logForm, .regForm').slideUp(300,function(){$(".regForm .main-form").show(); $(".regForm .confirmation").hide();}); },3000);
						});
					}
				} else {
					if(id==1){
						var txt="You already registered!";
						alert(txt);
					}else{
							$(tmp+".confirmation").fadeIn(300);
							setTimeout(function(){$(".logForm .confirmation").hide(); },3000);
					}
				}
			});

        } else {
            alert("Please enter these fields:\n\n" + message);
        }
}
function updateProfile() {
        var message = "";

	    message += checkInput("#container .email", "Email");
        
		
        if (message == "") {
           	$.ajax({
				type: "POST",
				url: "lib/updateUser.php",
				dataType: "json",
				data: {
					name: $("#container .name").val(),
					email: $("#container .email").val(),
					type:1,
					nodes: [$("#container .university").val(), $("#container .discipline").val()]
				}
			}).done(function(response) {
				console.log(response);
				if (response.success) {
					console.log("All good");
					$('.succ').html("Details updated successfully");
					setTimeout(function(){$('.succ').html("");},2000);
				} else {
					console.log("Something went wrong");
				}
			});

        } else {
            alert("Please enter these fields:\n\n" + message);
        }
}
function addGrade() {
        var message = "";

	    message += checkInput("#container .subj", "Select subject");
	    message += checkInput("#container .grad", "Select grade");
        
		
        if (message == "") {
			console.log("c "+$("#container .subj").val()+" "+$("#container .grad").val());
           	$.ajax({
				type: "POST",
				url: "lib/updateUser.php",
				dataType: "json",
				data: {
					subject: $("#container .subj").val(),
					grade: $("#container .grad").val(),
					type:2
				}
			}).done(function(response) {
				console.log(response);
				if (response.success) {
					var id=response.id;
					var points=$("#container .grad option:selected").data("points");
					$('#container .line.adding').before("<div class='line' data-id='"+id+"'>Subject: <span style='color:green'><u>"+$("#container .subj option:selected").html()+"</u></span> Grade: <span style='color:red'><u>"+$("#container .grad option:selected").html()+"</u></span>&emsp;<button onclick='deleteGrade("+id+", "+points+")'>Delete Grade</button></div>");
					countUcas(points);
					$("#container .subj option:selected").removeAttr("selected");
					$("#container .grad option:selected").removeAttr("selected");
					console.log("All good");
					$('.succ').html("Grade added successfully");
					setTimeout(function(){$('.succ').html("");},2000);
				} else {
					console.log("Something went wrong");
				}
			});

        } else {
            alert("Please enter these fields:\n\n" + message);
        }
}
function countUcas(points){
	$('.score').html(parseInt($('.score').html())+points);
}
function deleteGrade(id, points){
	$('.line[data-id='+id+']').fadeOut(200);
	$.ajax({
				type: "POST",
				url: "lib/updateUser.php",
				dataType: "json",
				data: {
					id: id,
					type:3
				}
			}).done(function(response) {
				countUcas(-parseInt(points));
			});
}
/* END USER REGISTRATION/LOGIN/UPDATE */

// Validating input
function checkInput(check_class, message) {
    var value = $(check_class).val();
    if (value == "0" || value == ""  || value == " " || (check_class.indexOf("email") > -1 && validateEmail(value) == false)) {
        $(check_class).addClass("error");
        return message + "\n";
    }
    $(check_class).removeClass("error");
    return "";
}
function checkCheckbox(check_class, message) {
    if (!$(check_class).is(':checked')) {
        $(check_class).parent().find("div.text").addClass("error");
        return message + "\n";
    } else {
        $(check_class).parent().find("div.text").removeClass("error");
    }

    return "";
}
function validateEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!regex.test(email)) {
        return false;
    }
    return true;
}
function validate(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    if(key!=8) {
        key = String.fromCharCode( key );
        var regex = /[0-9]|\./;
        if( !regex.test(key) ) {
            theEvent.returnValue = false;
            if(theEvent.preventDefault) theEvent.preventDefault();
        }
    }
}
