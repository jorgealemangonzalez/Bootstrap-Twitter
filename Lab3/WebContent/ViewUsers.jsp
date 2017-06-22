<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList" %>

<% 
List<BeanUser> list = new ArrayList<BeanUser>();

list = (List<BeanUser>) request.getAttribute("listUsers");
String action =(String) request.getAttribute("action");

BeanUser user = (BeanUser)request.getAttribute("user");
if(user.getUsername() == null){
	user = new BeanUser();
}
%>

<script type="text/javascript">

$(document).ready(function() {  	
    $("#follow").click(function(event){
    	var userN= document.getElementById("follow").className;
    	var act = document.getElementById("action").className;
    	$.post('FollowController',{action: "followUser", username: userN },
    			function(data,status){
		    		if(status != 401){
		    			$.get('FollowController',{action: act},function(data,status){
		    	    		if(status != 401){ 
		    					$('#content').html(data);
		    				}
		    			});
    				}
    			});	
    	});
    $("#following").click(function(event){
    	var userN= document.getElementById("following").className;
    	var act = document.getElementById("action").className;
    	$.post('FollowController',{action: "unFollow", username: userN },
    			function(data,status){
		    		if(status != 401){
		    			$.get('FollowController',{action: act},function(data,status){
		    	    		if(status != 401){ 
		    					$('#content').html(data);
		    				}
		    			});
    				}
    			});	
    	});
});
</script>



<div class="container col-md-6 col-md-offset-3">
	<% for(int i = 0 ; i < list.size() ; i++) { 
		BeanUser t = list.get(i);%>
   	<div class="row">
		<div class="card-block span4 well" id="card">
            <div class="row">
            
        		<div class="span1"><a href="" class="thumbnail"><img src="images/logo.jpg" height="42" width="42" alt=""></a></div>
        		<div class="span2">
	        			<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a id="username"><%=t.getUsername() %></a></li>
				 	    	<li class="breadcrumb-item active"> <%=t.getName() %> <%= t.getSurname() %></li>
							<li class="breadcrumb-item active"><%=t.getUserTweets().size() %> Tweets</li>
							<li class="breadcrumb-item active"><%=t.getFollowers().size() %> followers</li>
						    <%if (user.getFollowing().contains(t.getUsername())){ %>
	        					<li class="breadcrumb-item"> <a class="<%=t.getUsername() %>" id="following" >Following</a></li>
		        			<%}else if(user.getUsername().compareTo(t.getUsername()) != 0){ %>
		 			        	<li class="breadcrumb-item"> <a class="<%=t.getUsername() %>" id="follow" >Follow</a></li>
		        			<%} %>
		        		</ol>
	       		</div>
        	</div>
        </div>
	</div>
 	<% } %>
 	<div class="<%= action%>" id="action" style="display: none;">
 	
	 
</div>