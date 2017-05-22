<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<script>
$(document).ready(function(){
    $("#registerForm").validate({
    	submitHandler: function(form) {
    		$('#content').load('RegisterController',$("#registerForm").serialize());
    }
    });
});
</script>
   
<form id=registerForm action="" method="POST">
<table>
<tr> 
<td> User id </td> 
<td> <input type="text" name="user" value="${user.user}" id="user" class="required" minlength="5"/> </td> 
<c:if test="${user.error[0] == 1}">
   <td class="error"> The username already exists in our DB! </td> 
</c:if>
</tr>
<tr> 
<td> Mail </td> <td> <input type="text" name="mail"  value = "${user.mail}" id="mail" class="required email"/> </td>
</tr>
<tr> 
<td> <input name="sumbit" type="submit" value="Enviar"> </td>
</tr>
</table>
</form>
</body>
</html>