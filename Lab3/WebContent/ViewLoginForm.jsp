<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(document).ready(function(){
    $("#loginForm").validate({
    	submitHandler: function(form) {
    		$.post("LoginController",$("#loginForm").serialize())
    			.done(function(msg){
    				$('#content').load('ContentController');
    				$('#navigation').load('MenuController');
    			})
    			.fail(function(xhr, status, error) {
    				$("#loginError").html("<div class=\"alert alert-danger\"><strong>Error!</strong>Username or password do not match</div>")
    		    });
    }
    });
});

$(document).ready(function() {
    $("#ButtonRegister").click(function(event) {
        $('#content').load('RegisterController');
    });
});
</script>

<div class="container col-md-6 col-md-offset-3">
	<div class="row card">
	    <div class="card-block"> <!-- Offset to center it , col-widnow-size to select the size of the component depending on the window size -->
	    	<form role="form" id="loginForm" action="" method="POST">
				<fieldset>
					
					<!--Header-->
			        <div class="form-header  green">
			            <h3><i class="fa fa-lock"></i> Login:</h3>
			        </div>
					
					<hr class="colorgraph">
					<div class="md-form">
	                    <input type="text" name="username" id="username" value="${login.username}" class="form-control">
						<label for="username" class="">Username</label>
					</div>
					<div class="md-form">
	                    <input type="password" name="password" id="password" value="${login.password}" class="form-control">
						<label for="password" class="">Password</label>
					</div>
					<div id="loginError"></div>
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
