<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
});
</script>
	
	<div class="card">
		<form action="" method="post" id="registerForm" onsubmit="return validateMyForm();">
	
			<div class="card-block">
				<!--Header-->
		        <div class="form-header green">
		            <h3><i class="fa fa-user"></i> User Information:</h3>
		        </div>
		        <!-- User information -->
		        
		        <!-- 
   		        <div class="md-form">
		           	<input class="form-control" type="text" name="surname" id="surname"  required pattern="[A-Za-z]{1,}"/>
		            <label for="surname" id="puev"></label>
		            <script>
		            	document.getElementById('puev').innerHTML = '${user.username}'
		            </script>
		        </div>
		        -->
		        
		        
				<div class="md-form">
		            <input type="text" id="name" placeholder="Name" class="form-control" value="${user.name}">
		        </div>
				<div class="md-form">
		            <input type="text" id="username" placeholder="Username" class="form-control" value="${user.username}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="gender" placeholder="Gender" class="form-control" value="${user.gender}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="email" placeholder="Email" class="form-control" value="${user.email}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="passwords" placeholder="Password" class="form-control" value="${user.password}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="nickname" placeholder="Nickname" class="form-control" value="${user.nickname}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="dateofbirth" placeholder="Date of birth" class="form-control" value="${user.dateofbirth}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="address" placeholder="Address" class="form-control" value="${user.address}">
		        </div>
		        <div class="md-form">
		            <input type="text" id="number" placeholder="Phone Number" class="form-control" value="${user.phonenumber}">
		        </div>	
		        <div class="text-center">
		            <button class="btn btn-success waves-effect waves-light" type="submit" value="Enviar">Save</button>
		            <hr>
		        </div>	        	
			</div>
		</form>
	</div>
