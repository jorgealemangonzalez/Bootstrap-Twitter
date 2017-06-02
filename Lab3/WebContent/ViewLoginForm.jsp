<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(document).ready(function(){
    $("#loginForm").validate({
    	submitHandler: function(form) {
    		$('#content').load('LoginController',$("#loginForm").serialize());
    }
    });
});

$(document).ready(function() {
    $("#ButtonRegister").click(function(event) {
        $('#content').load('ContentController',{content: "RegisterController"});
        });
});

$(document).ready(function() {
    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
    $('#navigation').load('MenuController');
});
</script>

<div class="container center_container">
	<div class="row">
	    <div class="col-md-6 col-md-offset-3"> <!-- Offset to center it , col-widnow-size to select the size of the component depending on the window size -->
	    	<form role="form" id="loginForm" action="" method="POST">
				<fieldset>
					<h2>Please Sign In</h2>
					<hr class="colorgraph">
					<div class="form-group">
	                    <input type="text" name="username" id="username" value="${login.username}" class="form-control input-lg" placeholder="Username">
					</div>
					<div class="form-group">
	                    <input type="password" name="password" id="password" value="${login.password}" class="form-control input-lg" placeholder="Password">
					</div>
					${ login.error }
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6"> <!-- Fixed size -->
	                        <input name="submit" type="submit" class="btn btn-lg btn-success btn-block" value="Sign In">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="#" class="btn btn-lg btn-primary btn-block" id="ButtonRegister">Register</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
