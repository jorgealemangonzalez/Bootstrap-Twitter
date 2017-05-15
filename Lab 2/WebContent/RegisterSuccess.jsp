<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery for bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Register complete! </title>
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
	<div class="row">
		 <form class="form-horizontal">
            <fieldset>
                <!-- Address form -->
                <h3>Register succes!</h3>
                <br>
                <h2>User Profile</h2>
         
                <div class="control-group">
                    <label class="control-label">Name</label>
                    <div class="controls">
                        <input id="name" name="name" type="text" placeholder="Name"
                        class="input-xlarge" value="<%=user.getName() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Username</label>
                    <div class="controls">
                        <input id="username" name="username" type="text" placeholder="username"
                        class="input-xlarge" value="<%=user.getUsername() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Gender</label>
                    <div class="controls">
                        <input id="gender" name="gender" type="text" placeholder="gender"
                        class="input-xlarge" value="<%=user.getGender() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls">
                        <input id="email" name="email" type="text" placeholder="email"
                        class="input-xlarge" value="<%=user.getEmail() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Password</label>
                    <div class="controls">
                        <input id="password" name="password" type="text" placeholder="password"
                        class="input-xlarge" value="<%=user.getPassword() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Nickname</label>
                    <div class="controls">
                        <input id="nickname" name="nickname" type="text" placeholder="nickname"
                        class="input-xlarge" value="<%=user.getNickname() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Birth</label>
                    <div class="controls">
                        <input id="birth" name="birth" type="text" placeholder="birth"
                        class="input-xlarge" value="<%=user.getDateofbirth().toString() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Address</label>
                    <div class="controls">
                        <input id="address" name="address" type="text" placeholder="address"
                        class="input-xlarge" value="<%=user.getAddress() %>">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Phone number</label>
                    <div class="controls">
                        <input id="number" name="number" type="text" placeholder="number"
                        class="input-xlarge" value="<%=user.getPhonenumber() %>">
                    </div>
                </div>
                
              </fieldset>
         </form>
      </div>
  </div>
                
</body>
</html>