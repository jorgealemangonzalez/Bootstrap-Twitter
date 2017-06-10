<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
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

<div class="container col-md-6 col-md-offset-3">
	<div class="card testimonial-card">

		<div class="card-up default-color-dark">
		</div>

		<div class="avatar"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%288%29.jpg" class="rounded-circle img-responsive">
		</div>

		<div class="card-block">
			<h4 class="card-title statics-resume">
				<div class="tweets-resume">
					<h1>Tweets</h1>
					<p> 23 </p>
				</div>
				<div class="tweets-resume">
					<h1>Tweets</h1>
					<p> 23 </p>
				</div>
				<div class="tweets-resume">
					<h1>Tweets</h1>
					<p> 23 </p>
				</div>
			</h4>
			<hr>

			<p><i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, adipisci</p>

		</div>
	</div>
</div>









