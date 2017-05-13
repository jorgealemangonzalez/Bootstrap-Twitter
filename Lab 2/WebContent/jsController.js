//colors
var gray = "rgb(182,182,182)";
var white = "rgb(255,255,255)";
var red = "#ff6666";
var green = "#66cc66";
var boolpass = null;
var boolemail = null;

function checkPass(){
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('confirm_password');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    if(pass1.value == pass2.value){    	
    	boolpass = true;
        pass2.style.backgroundColor = green;
        message.style.color = green;
        message.innerHTML = "Passwords Match";
    }else{
    	boolpass = false;
        pass2.style.backgroundColor = red;
        message.style.color = red;
        message.innerHTML = "Passwords Do Not Match!"
    }
} 
//validate pass
function checkValidPass(pass){
	var regPass = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,50}$/;
	//http://stackoverflow.com/questions/12090077/javascript-regular-expression-password-validation-having-special-characters
    var passEl = document.getElementById('password');
    console.log("Pass:");
    console.log(pass);
    if(regPass.test(pass) == false){
    	console.log("Invalid pass");
    	passEl.style.backgroundColor = red;
    }else{
    	console.log("Valid pass");
    	passEl.style.backgroundColor = green;
    }
}


//validate email
function email_validate(email){
	var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
	var emailElm = document.getElementById('email');
	var message = document.getElementById('status');
    if(regMail.test(email) == false){
    	boolemail = false;
    	emailElm.style.backgroundColor = gray;
    	message.style.color = red;
    	message.innerHTML    = "Email address is not valid yet. Use example@domain.ext";
    }
    else{
    	boolemail = true;
    	emailElm.style.backgroundColor = white;
    	message.style.color = green;
    	message.innerHTML	= "Correct Email!";	
    }
}

//validate Form
function validateForm(){
	if(boolpass && boolemail)return true;
	else return false;
}


