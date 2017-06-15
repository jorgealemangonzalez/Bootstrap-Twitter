<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}

%>
<script>
$(document).ready(function(){
    $("#editForm").validate({
    	submitHandler: function(form) {
    		console.log("GO EDIT FORM");
   			$.post('EditProfileController',$("#editForm").serialize()).done(function(data){
   				alert("Your changes has been saved!");
   			});
   			
    	}
    });
});
</script>
<div class="container col-md-6 col-md-offset-3">
	<div class="card testimonial-card">

		<div class="card-up default-color-dark">
		</div>

		<div class="avatar"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%288%29.jpg" class="rounded-circle img-responsive">
		</div>

		<div class="card-block">
			<h4 class="card-title statics-resume">
				<div class="resume-statics">
					<h3>Tweets</h3>
					<p> 23 </p>
				</div>
				<div class="resume-statics">
					<h3>Following</h3>
					<p> 7 </p>
				</div>
				<div class="resume-statics">
					<h3>Followers</h3>
					<p> 1 </p>
				</div>
			</h4>
			<hr>
			<form action="" method="post" id="editForm" onsubmit="return validateMyEditForm();">
			        
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
			        <input type="text" id="password" name="password" placeholder="Password" class="form-control" value="${user.password}">
			    </div>
			    <div class="md-form">
			        <input type="text" name="confirm_password" id="confirm_password" onkeyup="checkPass();" placeholder="Password" class="form-control" value="${user.password}">
			    </div>
			    <span id="confirmMessage" class="confirmMessage"></span>
			    
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
			</form>
		</div>
	</div>
</div>