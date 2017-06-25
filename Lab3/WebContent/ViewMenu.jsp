<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="models.BeanUser"%>
<% 

BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}

%>

<script type="text/javascript">

$(document).ready(function() {    
    $("#myProfile").click(function(event){
    	$('#content').load('EditProfileController',{profile: ""});	//No profile means my profile
    });
    
    $("#myTweets").click(function(event){
    	$.get('TweetsController',{action: "getUserTweets"},function(data,status){
    		if(status != 401){
    			$('#content').html(data);
    		}
    	});
    });
    $("#followerTweets").click(function(event){
    	$.get('TweetsController',{action: "getMyFollowers"},function(data,status){
    		if(status != 401){
    			$('#content').html(data);
    		}
    	});
    });
    
    $("#TweetsController").click(function(event){
    	$.get('TweetsController',{action:"getAllTweets"},function(data,status){
    		if(status != 401){ 
				$('#content').html(data);
			}
	        	
    	});	
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
	$("#newTweet").click(function(event){
	  	$('#content').load('PublishTweet.jsp');	
	  });
	
	$("#allUsers").click(function(event){
		$("#content").load("UserListController");
	});
	
	$("#followingUsers").click(function(event){
		$.get('UserListController',{action:"getMyFollowing"},function(data,status){
    		if(status != 401){ 
				$('#content').html(data);
			}
	        	
    	});
	});
	
	$("#followersUsers").click(function(event){
		$.get('UserListController',{action:"getMyFollowers"},function(data,status){
    		if(status != 401){ 
				$('#content').html(data);
			}
	        	
    	});
	});
	

    $("#register").click(function(event) {
        $('#content').load('RegisterController');
    });
    
    $("#login").click(function(event) {
        $('#content').load('LoginController');
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
                <a class="nav-link dropdown-toggle" id="dropdownMenuTweets" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tweets</a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuTweets">
                    <a class="dropdown-item" id="TweetsController">All tweets</a>
                    <%if(user != null){ %>
                    <a class="dropdown-item" id="followerTweets">Following users tweets</a>
                    <a class="dropdown-item " id="myTweets">My tweets</a>
                    <% } %>
                </div>
            </li>
            <% if( user != null){ %>
            <li class="nav-item btn-group">
                <a class="nav-link dropdown-toggle" id="dropdownMenuAccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuAccount">
                    <a class="dropdown-item" id="myAccount">My account</a>
                    <a class="dropdown-item" id="myProfile">My information</a>
                </div>
            </li>
            <% } %>
            <li class="nav-item btn-group">
	            <a class="nav-link dropdown-toggle" id="dropdownMenuUsers" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Users</a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuUsers">
                    <a class="dropdown-item" id="allUsers">All users</a>
                    <% if(user != null){ %>
                    <a class="dropdown-item" id="followingUsers">Following</a>
                    <a class="dropdown-item" id="followersUsers">Followers</a>
                    <% } %>
                </div>
            </li>
	                
            
        </ul>
        
        <ul class="navbar-nav ml-auto nav-flex-icons">
        
        <% if(user == null){ %>
	        <li class="nav-item">
	            <a class="nav-link" id="login">Log in</a>
	        </li>
	        <li class="nav-item">
	            <a class="nav-link" id="register">Register</a>
	        </li>
        <% }else{ %>
	        <br>
        	<li class="nav-item">
        		<a class="nav-link">
        			<i class="fa fa-edit" id="newTweet">Publish Tweet</i>
        		</a>
        	</li>
	        
	        <li class="nav-item">
	            <a class="nav-link" id="logout">Log out</a>
	        </li>
        <% } %>
        <form class="form-inline waves-effect waves-light">
            <input class="form-control" type="text" placeholder="Search">
        </form>
        </ul>
    </div>
</nav>
<!--/.Navbar-->



