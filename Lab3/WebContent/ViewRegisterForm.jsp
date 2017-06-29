<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="models.BeanUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<script>
$(document).ready(function(){
    $("#registerForm").validate({
    	submitHandler: function(form) {
    		if (confirm("You will be registered in our website!") == true && validateMyForm()) {
    			$('#content').load('RegisterController',$("#registerForm").serialize());
    	    }
    }
    });
});

  
var input  = document.getElementById('email');
input.oninvalid = function(event) {
    event.target.setCustomValidity('Username should only contain lowercase letters. e.g. john');
}

</script>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
%> 
<!--Form with header-->
<div class="container col-md-6 col-md-offset-3">
	<div class="card">
		<form action=""   method="post" id="registerForm" > 
		
		    <div class="card-block">
		
		        <!--Header-->
		        <div class="form-header green">
		            <h3><i class="fa fa-user"></i> Register:</h3>
		        </div>
		
		        <!--Body-->
		        <div class="md-form">
		            <input class="form-control" type="text" name="name" id="name" value="<%=user.getName() %>" required pattern="[A-Za-z]{1,}"
	       					title="Name should only contain letters contain"/>
		            <label for="name">Your name</label>
		            <p class="help-block">(Required, only letters)</p>
		        </div>
		        <div class="md-form">
		           	<input class="form-control" type="text" name="surname" id="surname" value="<%=user.getSurname() %>" required pattern="[A-Za-z]{1,}"/>
		            <label for="surname">Your surname</label>
		            <p class="help-block">(Required, only letters)</p>
		        </div>
		
		        <div class="md-form">
		            <input class="form-control" type="text" name="username" id="username" value="<%=user.getUsername() %>" required pattern="[A-Za-z]{1,}"/>
					<label for="username">Your username</label>
					<p class="help-block"> (Required, only letters and unique) </p>
					<% 	
						if ( user.getError()[1] == 1) {
							 out.println("<div class=\"alert alert-danger\"><strong>Error!</strong>The username already exists in our DB!</div>"); 
						}
					%>
		        </div>
	  	        
	  	        
	  	        <div class="form-group">
		 	        <label class="control-label" for="gender"><h4>Gender(Required)</h4></label>
					    <p>
					      <input name="gender" type="radio" value="Male" checked/>
					      <label for="Male">Male</label>
					    </p>
					    <p>
					      <input name="gender" type="radio" value="Female" />
					      <label for="Female">Female</label>
					    </p>
					      <p>
					        <input name="gender" type="radio" value="Other" />
					        <label for="Other">Other</label>
					    </p>
			  	</div>
		        
	     
		        
		        <div class="md-form" >
		           	<input class="form-control" type="text" name="email" id="email" value="<%=user.getEmail() %>" onchange="email_validate(this.value);" required />
					<span id="status" class="status"></span>
	 				<label for="email">Your email</label>
	 				<p class="error-block">(Required, valid e-mail address and unique) We will send you a login page</p> 
	 				<% 	
						if ( user.getError()[0] == 1) {
							out.println("<div class=\"alert alert-danger\"><strong>Error!</strong>The email already exists in our DB!</div>"); 				
						}
					%>
		        </div>
		        
		        
	   	        <div class="md-form">
		           	<input class="form-control" type="password" name="password" id="password"  value="<%=user.getPassword() %>" onkeyup="checkValidPass();" required />
					<label for="password">Your password</label>
					<span id="confirmPassword" class="confirmMessage"></span>
					<p class="help-bloc">(Required, 6 characters minimum, some letter , number and sing !@#$%^&*)</p> 
		        </div>
		        
		         <div class="md-form">
		           	<input class="form-control " type="password" name="confirm_password" id="confirm_password" onkeyup="checkPass();"  required/>
					<label for="password">Confirm your password</label>
					<span id="confirmMessage" class="confirmMessage"></span>
					<p class="help-bloc">(Required)</p> 
		        </div>
		        
		     	<div class="md-form">
					<input class="form-control" type="text" name="address" id="address" value="<%=user.getAddress() %>" />
		            <label for="address">Your address</label>
					<p class="help-block">(Optional) ¿Where do you live?</p>
	  	        </div>        
		
				<div class="md-form">
					<input class="form-control" type="number" name="phonenumber" id="phonenumber" value="<%=user.getPhonenumber() %>" maxlength="9"/>
		            <label for="phonenumber">Your phone number</label>
					<p class="help-block">(Optional) Your 9 digit phone number</p>
	  	        </div>
		
		
		        <div class="text-center">
		            <button class="btn btn-success waves-effect waves-light" type="submit" value="Enviar">Sign up</button>
		            <hr>
		        </div>
		
		    </div>
	    </form>
	</div>
		</div>
<!--/Form with header-->