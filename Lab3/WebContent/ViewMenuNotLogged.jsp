<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>
<div class="container">
	<div id="header" class="navbar-wrapper">
	    <div class="container-fluid">
	        <nav class="navbar navbar-fixed-top full_bar_style">
	        	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
	               <div class="navbar-header">
	                   <a class="navbar-brand" href="#">Logo</a>
	               </div>
	               <ul class="nav navbar-nav pull-right">
	                   <li class=""><a class="menu" id="LoginController" href="#">Log in</a></li>
	                   <li class=""><a class="menu" id="UserInformationController" href="#">Log as anonymous</a></li>
	                   <li class=""><a class="menu" id="RegisterController" href="#">Register</a></li>
	               </ul>
              	</div>
	        </nav>
	    </div>
	</div>
</div>