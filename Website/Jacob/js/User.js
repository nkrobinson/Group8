function regOpen(){
	$('.regForm').slideDown(300);
	$('.logForm').slideUp(300);
}
function logOpen(){
	$('.logForm').slideDown(300);
	$('.regForm').slideUp(300);
}
function authUser(id) {
        var message = "";

		var tmp=".regForm ";
		if(id==2)
			tmp=".logForm ";
        message += checkInput(tmp+".name", "Name");
        message += checkInput(tmp+".pass", "Password");
        if (message == "") {
           	$.ajax({
				type: "POST",
				url: "lib/authUser.php",
				dataType: "json",
				data: {
					name: $(tmp+".name").val(),
					pass: $(tmp+".pass").val(),
					type:id
				}
			}).done(function(response) {
				if (response.success) {
					$('.navigation').html($(tmp+".name").val());
					$('.logForm, .regForm').slideUp(300);
				} else {
					var txt="You already registered!";
					if(id==2)
						txt="WRONG DETAILS!";
					alert(txt);
				}
			});

        } else {
            alert("Please enter these fields:\n\n" + message);
        }
}

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
