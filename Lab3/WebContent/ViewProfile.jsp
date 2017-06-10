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

BeanUser userProfile = null;
if (request.getAttribute("userProfile")!=null) {
	userProfile = (BeanUser)request.getAttribute("userProfile");
}
else {
	userProfile = new BeanUser();
}
%>

<div class="container col-md-6 col-md-offset-3">
	<div class="card testimonial-card">

		<div class="card-up default-color-dark">
		</div>

		<div class="avatar"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%288%29.jpg" class="rounded-circle img-responsive">
		</div>
		
		
		
		<a title="follow" class="btn-floating btn-small waves-effect waves-light follow-button follow-user-card green"><i class="fa fa-plus"></i></a>
		<!-- if followed
		<a title="unfollow" class="btn-floating btn-small waves-effect waves-light follow-button follow-user-card red"><i class="fa fa-close "></i></a>
		 -->
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

			<div class="list-group">
			  <div class="list-group-item list-group-item-action flex-column align-items-start">
			    <div class="d-flex justify-content-between">
			      <h5 class="mb-1">Nick</h5>
			    </div>
			    <p class="mb-1">${userProfile.nickname}</p>
			  </div>
			  <div class="list-group-item list-group-item-action flex-column align-items-start">
			    <div class="d-flex justify-content-between">
			      <h5 class="mb-1">Name</h5>
			    </div>
			    <p class="mb-1">${userProfile.name} ${userProfile.surname}</p>
			  </div>
			  <div class="list-group-item list-group-item-action flex-column align-items-start">
			    <div class="d-flex justify-content-between">
			      <h5 class="mb-1">Email</h5>
			    </div>
			    <p class="mb-1">${userProfile.email}</p>
			  </div>
			  <div class="list-group-item list-group-item-action flex-column align-items-start">
			    <div class="d-flex justify-content-between">
			      <h5 class="mb-1">Birth</h5>
			    </div>
			    <p class="mb-1">${userProfile.dateofbirth}</p>
			  </div>
			  
			  <div class="list-group-item list-group-item-action flex-column align-items-start">
			    <div class="d-flex justify-content-between">
			      <h5 class="mb-1">Adress</h5>
			    </div>
			    <p class="mb-1">${userProfile.address}</p>
			  </div>
			  
		  </div>

		</div>
	</div>
</div>









