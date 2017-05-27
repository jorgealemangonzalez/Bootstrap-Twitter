<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery for bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->

<!-- Optional theme -->

<!-- Latest compiled and minified JavaScript -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Register complete! </title>
</head>

<body>
<script type="text/javascript">
$(document).one('ready',function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('UserInformationController');
});
</script>


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
                        class="input-xlarge" value="${nickname}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Username</label>
                    <div class="controls">
                        <input id="username" name="username" type="text" placeholder="username"
                        class="input-xlarge" value="${username}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Gender</label>
                    <div class="controls">
                        <input id="gender" name="gender" type="text" placeholder="gender"
                        class="input-xlarge" value="${gender}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls">
                        <input id="email" name="email" type="text" placeholder="email"
                        class="input-xlarge" value="${email}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Password</label>
                    <div class="controls">
                        <input id="password" name="password" type="text" placeholder="password"
                        class="input-xlarge" value="${password}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Nickname</label>
                    <div class="controls">
                        <input id="nickname" name="nickname" type="text" placeholder="nickname"
                        class="input-xlarge" value="${nickname}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Birth</label>
                    <div class="controls">
                        <input id="birth" name="birth" type="text" placeholder="birth"
                        class="input-xlarge" value="${dateofbirth}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Address</label>
                    <div class="controls">
                        <input id="address" name="address" type="text" placeholder="address"
                        class="input-xlarge" value="${address}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Phone number</label>
                    <div class="controls">
                        <input id="number" name="number" type="text" placeholder="number"
                        class="input-xlarge" value="${phonenumber}">
                    </div>
                </div>
                
              </fieldset>
         </form>
      </div>
  </div>
                
</body>
</html>