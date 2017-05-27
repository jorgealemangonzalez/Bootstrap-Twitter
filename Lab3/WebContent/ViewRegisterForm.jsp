<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" import="models.BeanUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<script>
$(document).ready(function(){
    $("#registerForm").validate({
    	submitHandler: function(form) {
    		if (confirm("You will be registered in our website!") == true) {
    			$('#content').load('RegisterController',$("#registerForm").serialize());
    	    }
    }
    });
});
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            format: 'mm/dd/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
            
        });
});
</script>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%> 
 
<div class="container center_container">
	<h2>Register form</h2>
	<form action="" method="post" id="registerForm" onsubmit="return validateMyForm();">
		<fieldset>
			<div class="form-group">
				
				<label> Name</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=user.getName() %>" required pattern="[A-Za-z]{1,}"
       					title="Name should only contain letters contain"/>
				<p class="help-block">(Required, only letters)</p>
			</div>
			
			<div class="form-group">
				<label> Surname</label>
				<input class="form-control" type="text" name="surname" id="surname" value="<%=user.getSurname() %>" required pattern="[A-Za-z]{1,}"/>
				<p class="help-block">(Required, only letters)</p>
			</div>
			
			<div class="form-group">
				<label> Username</label>
				<input class="form-control" type="text" name="username" id="username" value="<%=user.getUsername() %>" required pattern="[A-Za-z]{1,}"/>
				<p class="help-block"> (Required, only letters and unique) </p>
				<% 	
					if ( user.getError()[1] == 1) {
						 out.println("<div class=\"alert alert-danger\"><strong>Error!</strong>The username already exists in our DB!</div>"); 
					}
				%>
				
			</div>
			
			<div class="form-group">
				<label> Nickname </label>
				<input class="form-control" type="text" name="nickname" id="nickname" value="<%=user.getNickname() %>" required maxlength="20"/>
				<p class="help-block"> Some funny nick (20 characters maximum)</p>
			</div>
			
			<div class="form-group">
				<label class="control-label" for="gender">Gender(Required)</label>
				<div class="controls">
					<div class="radio">
						<label><input type="radio" name="gender" value="Male"checked> Male</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="gender" value="Female">Female</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="gender" value="Other">Other</label>
					</div>
				</div>
			</div>
			
						
			<div class="form-group">
				<label> E-mail </label>
					<input class="form-control" type="email" name="email" id="email" value="<%=user.getEmail() %>" onchange="email_validate(this.value);" required/>
						<span id="status" class="status"></span>
 				<p class="error-block">(Required, valid e-mail address and unique) We will send you a login page</p> 
 				<% 	
					if ( user.getError()[0] == 1) {
						out.println("<div class=\"alert alert-danger\"><strong>Error!</strong>The email already exists in our DB!</div>"); 				
					}
				%>
			</div>
			
			 <div class="form-group">
		        <label >Date</label>
		            <div class="input-group input-append date" id="datePicker">
		                <input type="text" class="form-control" id="dateofbirth" name="dateofbirth" />
		                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
		        	</div>
		    </div>
			
			<div class="form-group">
				<label> Password </label>
					<input class="form-control" type="password" name="password" id="password"  value="<%=user.getPassword() %>" onkeyup="checkValidPass();" required />
					<p class="help-bloc">(Required, 6 characters minimum, some letter , number and sing !@#$%^&*)</p>
				<label> Confirm password</label>
					<input class="form-control inputpass" type="password" name="confirm_password" id="confirm_password"  placeholder="Enter again to validate"  onkeyup="checkPass();"  required/>
						<span id="confirmMessage" class="confirmMessage"></span>
					<p class="help-block"> (Required)</p>
			</div>
		
			
			<label> Address </label>
				<input class="form-control" type="text" name="address" id="address" value="<%=user.getAddress() %>" />
				<p class="help-block">(Optional) ¿Where do you live?</p>
			<br>
			
			
			<label> Phone number </label>
				<input class="form-control" type="number" name="phonenumber" id="phonenumber" value="<%=user.getPhonenumber() %>" maxlength="9"/>
				<p class="help-block">(Optional) Your 9 digit phone number</p>
			<br>
			
			<input class="form-control" type="submit" value="Enviar"> 
		</fieldset>
	</form>
</div>
</body>
</html>