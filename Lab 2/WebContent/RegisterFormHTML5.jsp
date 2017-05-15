<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery for bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--  Javascript -->
<script type="text/javascript" src="jsController.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Template Register Form (Validation HTML5) </title>
</head>

<body>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%>
<div class="container">
	<h2>Register form</h2>
	<form action="/Lab_2/FormController" method="post" id="registerForm" onsubmit="event.preventDefault(); validateMyForm();">
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
				<input class="form-control" type="text" name="nickname" id="nickname" value="<%=user.getNickname() %>" required pattern=".{1,20}"/>
				<p class="help-block"> Some funny nick (20 characters minimum)</p>
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
				<label> Date of birth </label>
				<input class="form-control" id="dateofbirth" name="dateofbirth" type="date" value="<%=user.getDateofbirth() %>" value="1996-08-28"/>
				<p class="help-block">¿When did you born?</p>
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
				<label> Password </label>
					<input class="form-control" type="password" name="password" id="password"  value="<%=user.getPassword() %>" onkeyup="checkValidPass(this.values);" required />
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
				<input class="form-control" type="text" name="phonenumber" id="phonenumber" value="<%=user.getPhonenumber() %>" pattern=".{0}|[0-9]{9}"/>
				<p class="help-block">(Optional) Your 9 digit phone number</p>
			<br>
			
			<input class="form-control" type="submit" value="Enviar"> 
		</fieldset>
	</form>
</div>
</body>
</html>