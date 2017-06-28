
//colors
var gray = "rgb(182,182,182)";
var white = "rgb(255,255,255)";
var red = "#ff6666";
var green = "#66cc66";

//Flags
var boolpass = null;
var validpass = null;
var boolemail = null;
var booldate = true;

//date validate
function isValidDate(dateString)
{
    // First check for the pattern
    if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
        return false;

    // Parse the date parts to integers
    var parts = dateString.split("/");
    var day = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10);
    var year = parseInt(parts[2], 10);

    // Check the ranges of month and year
    if(year < 1900 || year >= 2018 || month == 0 || month > 12)
        return false;

    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

    // Adjust for leap years
    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
        monthLength[1] = 29;

    // Check the range of the day
    return day > 0 && day <= monthLength[month - 1];
};


function date_validate(date){
	var dateEl = document.getElementById('dateofbirth');
	if(isValidDate(date)){
		dateEl.setAttribute("style", "border-bottom: 1px solid green !important; box-shadow:  0 1px 0 0 green !important");
		booldate=true;
	}else{
		booldate=false;
		dateEl.setAttribute("style", "border-bottom: 1px solid red !important; box-shadow:  0 1px 0 0 red !important");
	}
}


function validateMyEditForm(){
	
	checkPass();
	checkValidPass(document.getElementById('password').value)
}

function validateMyForm(){
	checkPass();
	checkValidPass(document.getElementById('password').value);
	email_validate(document.getElementById('email').value);
	console.log(boolpass);
	console.log(validpass);
	console.log(boolemail);
	if(boolpass && validpass && boolemail && booldate){
		console.log("Form succesfully filled");
		return true;
	}
	else{
		console.log("There is some error in the form");
		return false;
	}
}

function checkPass(){
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('confirm_password');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    if(pass1.value == pass2.value){    	
    	boolpass = true;
        message.style.color = green;
        message.innerHTML = "Passwords Match";
    }else{
    	boolpass = false;
        message.style.color = red;
        message.innerHTML = "Passwords Do Not Match!"
    }
} 
//validate pass
function checkValidPass(){
	var regPass = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,50}$/;	//Letters nums and some sign ( 6 min )
	//http://stackoverflow.com/questions/12090077/javascript-regular-expression-password-validation-having-special-characters
    var passEl = document.getElementById('password');
    var message = document.getElementById('confirmPassword');
    //console.log("Pass:");
    //console.log(pass);
    if(regPass.test(passEl.value) == false){
    	validpass=false;
    	message.style.color = red;
        message.innerHTML = "Invalid Password";
    	passEl.setAttribute("style", "border-bottom: 1px solid red !important; box-shadow:  0 1px 0 0 red !important");
    }else{
    	validpass=true;
    	message.style.color = green;
        message.innerHTML = "Valid Password";
    	passEl.setAttribute("style", "border-bottom: 1px solid green !important; box-shadow:  0 1px 0 0 green !important");
    }
}


//validate email
function email_validate(email){
	var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
	var emailElm = document.getElementById('email');
	var message = document.getElementById('status');
    if(regMail.test(email) == false){
    	boolemail = false;
    	emailElm.setAttribute("style", "border-bottom: 1px solid red !important; box-shadow:  0 1px 0 0 red !important");
    	message.innerHTML    = "Email address is not valid yet. Use example@domain.ext";
    }
    else{
    	boolemail = true;
    	emailElm.setAttribute("style", "border-bottom: 1px solid green !important; box-shadow:  0 1px 0 0 green !important");
    	message.style.color = green;
    	message.innerHTML	= "Correct Email!";	
    }
}