<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}

%>
<script>
$(document).ready(function(){
    $("#editForm").validate({
    	submitHandler: function(form) {
    		console.log("GO POST")
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
					<span class="badge badge-primary badge-pill"><%= user.getUserTweets().size() %> </span>
				</div>
				<div class="resume-statics">
					<h3>Following</h3>
					<span class="badge badge-primary badge-pill"><%= user.getFollowing().size() %> </span>
				</div>
				<div class="resume-statics">
					<h3>Followers</h3>
					<span class="badge badge-primary badge-pill"><%= user.getFollowers().size() %> </span>
				</div>
			</h4>
			<hr>
			<form action="" method="post" id="editForm" onsubmit="return validateMyEditForm();">
			        
			    Name:
				<div class="md-form">
				    <input type="text" name="name" id="name" placeholder="Name" class="form-control" value="<%=user.getName() %>">
				</div>
				Username:
				<div class="md-form">
		            <input type="text" id="username" name="username" placeholder="Username" class="form-control" value="<%=user.getUsername() %>" disabled>
		        </div>
		        Gender:
			    <div class="md-form">
			        <input type="text" id="gender" name="gender" placeholder="Gender" class="form-control" value="<%=user.getGender() %>" disabled>
			    </div>
			    Email:
			    <div class="md-form">
			        <input type="text" id="email" name="email" placeholder="Email" class="form-control" value="<%=user.getEmail() %>">
			    </div>
			    Password
			    <div class="md-form">
			        <input type="text" id="password" name="password" name="password" placeholder="Password" class="form-control" value="<%=user.getPassword() %>">
			    </div>
			    Confirm password:
			    <div class="md-form">
			        <input type="text" name="confirm_password" id="confirm_password" onkeyup="checkPass();" placeholder="Password" class="form-control" value="<%=(user.getPassword() == null ? "" : user.getPassword()) %>">
			    </div>
			    <span id="confirmMessage" class="confirmMessage"></span>
			    <br>
			    Address:
			    <div class="md-form">
			        <input type="text" id="address" name="address" placeholder="Address" class="form-control" value="<%=(user.getAddress() == null ? "" :  user.getAddress()) %>">
			    </div>
			    Phonenumber:
			    <div class="md-form">
			        <input type="text" id="phonenumber" name="phonenumber" maxlength="9" placeholder="Phone Number" class="form-control" value="<%=user.getPhonenumber() %>">
			    </div>	
			    <div class="text-center">
			        <button class="btn btn-success waves-effect waves-light" type="submit" value="Enviar">Save</button>
			        <hr>
			    </div>	        	
			</form>
		</div>
	</div>
</div>