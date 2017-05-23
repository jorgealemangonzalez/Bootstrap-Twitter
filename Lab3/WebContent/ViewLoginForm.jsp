<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(document).ready(function(){
    $("#loginForm").validate({
    	submitHandler: function(form) {
    		$('#content').load('LoginController',$("#loginForm").serialize());
    }
    });
});
</script>
<!-- 
<form id="loginForm" action="" method="POST">
<table>
<tr> 
<td> User id </td> 
<td> <input type="text" name="user" value="${login.user}" id="user" class="required" minlength="5"/> </td> 
<c:if test="${login.error[0] == 1}">
   <td class="error"> Nonexistent username in our DB! </td> 
</c:if>
</tr>
<tr> 
<td> <input name="sumbit" type="submit" value="Enviar"> </td>
</tr>
</table>
</form>
-->
<div class="container">
	<div class="row" style="margin-top:60px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
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
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
	                        <input name="submit" type="submit" class="btn btn-lg btn-success btn-block" value="Sign In">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="" class="btn btn-lg btn-primary btn-block">Register</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>