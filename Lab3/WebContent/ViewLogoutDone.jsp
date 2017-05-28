<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!
        $('#navigation').load('MenuController');   
});
</script>


<p id="nav"> Logout done! </p>