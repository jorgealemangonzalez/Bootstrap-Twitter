<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<script type="text/javascript">

$(document).ready(function() {    
    $("#myProfile").click(function(event){
    	$('#content').load('EditProfileController',{profile: ""});	//No profile means my profile
    });
    
    $("#MyTweetsController").click(function(event){
    	$('#content').load('MyTweetsController',{profile: ""});	//No profile means my profile
    });
    
    $("#allTweetsController").click(function(event){
    	$('#content').load('TweetsController',{profile: ""});	//No profile means my profile
    });
    
	$("#logout").click(function(event){
		$.get("LogoutController", function(data, status){
			if(data == "Logout done"){
				$('#content').load('ContentController');
				$('#navigation').load('MenuController');
			}else
	        	alert("Error while logout: Data: " + data + "\nStatus: " + status);
	    });
    });
});
</script>
<!--Navbar-->
<nav class="navbar navbar-toggleable-md navbar-dark bg-primary green">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#collapseEx12" aria-controls="collapseEx2" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"><img alt="Logo" src="images/logo.jpg" height="42" width="42"/></a>
    <div class="collapse navbar-collapse" id="collapseEx12">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item btn-group">
                <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tweets</a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" id="allTweetsController">All tweets</a>
                    <a class="dropdown-item">My followers tweets</a>
                    <a class="dropdown-item linkController" id="MyTweetsController">My tweets</a>
                </div>
            </li>
            <li class="nav-item btn-group">
                <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" id="myAccount">My account</a>
                    <a class="dropdown-item" id="myProfile">My information</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link linkController" id="logout">Log out</a>
            </li>
        </ul>
        <form class="form-inline waves-effect waves-light">
            <input class="form-control" type="text" placeholder="Search">
        </form>
    </div>
</nav>
<!--/.Navbar-->



