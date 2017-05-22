<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>

<table>
<tr>
<td> <a class="menu" id="RegisterController" href=#> Registration </a> </td>
<td> <a class="menu" id="LoginController" href=#> Login </a> </td>
</tr>
</table>	