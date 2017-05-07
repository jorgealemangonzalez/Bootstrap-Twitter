<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Template Register Form (Validation JQuery) </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
    $("#registerForm").validate();
  });
</script>
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

<form action="/Lab_2/FormController" method="post" id="registerForm">
<fieldset>
	
		<label> Name (Required, only letters)</label>
		<input type="text" name="name" id="name" value="<%=user.getName() %>" required pattern="[A-Za-z]"/>
		<br>
		
		<label> Surname (Required, only letters)</label>
		<input type="text" name="surname" id="surname" value="<%=user.getSurname() %>" required pattern="[A-Za-z]"/>
		<br>
		
		<label> Username (Required, only letters and unique) </label>
		<input type="text" name="username" id="username" value="<%=user.getUsername() %>" required pattern="[A-Za-z]"/>
		<% 	
			if ( user.getError()[0] == 1) {
				out.println("The username already exists in our DB!");
			}
		%>
		<br>
		
		<label> Nickname </label>
		<input type="text" name="nickname" id="nickname" value="<%=user.getNickName() %>" required/>
		<br>
		
		<label> Gender (Required)</label>
		<input type="radio" name="gender" value="Male" checked>
		<input type="radio" name="gender" value="Female">
		<input type="radio" name="gender" value="Other">
		<input type="text" name="gender" id="gender" value="<%=user.getgender() %>" required/>
		<br>
		
		<label> Date of birth </label>
		<input id="meeting" type="date"/>
		<br>
		
		<label> Email</label>
		<label> E-mail (Required, valid e-mail adress and unique) </label>
		<input type="email" name="mail" id="mail" value="<%=user.getEmail() %>" required email/>
		<br>
		
		<label> Password (Required, 6 characters minimum and some sign: .,¡!?¿$-@ )</label>
		<input type="password" name="password" id="password" value="<%=user.getPassword() %>" required pattern="\d\D[\.\,¡!?¿\$\-@]+{6}" />
		<label> Confirm password (Required) </label>
		<input type="password" name="confirm_password" id="confirm_password" required  />
		<br>
		
		<label> Address </label>
		<input type="text" name="address" id="address" value="<%=user.getAddress() %>" />
		<br>
		
		
		<label> Phone number </label>
		<input type="text" name="PhoneNumber" id="PhoneNumber" value="<%=user.getPhoneNumber() %>" />
		<br>
		
		<input type="submit" value="Enviar"> 
	</fieldset>
</form>
</body>
</html>