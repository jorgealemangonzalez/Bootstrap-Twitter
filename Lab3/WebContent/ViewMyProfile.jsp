<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
});
</script>

<div class="container center_container">
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
                        class="input-xlarge" value="${user.nickname}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Username</label>
                    <div class="controls">
                        <input id="username" name="username" type="text" placeholder="username"
                        class="input-xlarge" value="${user.username}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Gender</label>
                    <div class="controls">
                        <input id="gender" name="gender" type="text" placeholder="gender"
                        class="input-xlarge" value="${user.gender}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls">
                        <input id="email" name="email" type="text" placeholder="email"
                        class="input-xlarge" value="${user.email}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Password</label>
                    <div class="controls">
                        <input id="password" name="password" type="text" placeholder="password"
                        class="input-xlarge" value="${user.password}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Nickname</label>
                    <div class="controls">
                        <input id="nickname" name="nickname" type="text" placeholder="nickname"
                        class="input-xlarge" value="${user.nickname}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Birth</label>
                    <div class="controls">
                        <input id="birth" name="birth" type="text" placeholder="birth"
                        class="input-xlarge" value="${user.dateofbirth}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Address</label>
                    <div class="controls">
                        <input id="address" name="address" type="text" placeholder="address"
                        class="input-xlarge" value="${user.address}">
                    </div>
                </div>
                
                <div class="control-group">
                    <label class="control-label">Phone number</label>
                    <div class="controls">
                        <input id="number" name="number" type="text" placeholder="number"
                        class="input-xlarge" value="${user.phonenumber}">
                    </div>
                </div>
                
              </fieldset>
         </form>
      </div>
  </div>