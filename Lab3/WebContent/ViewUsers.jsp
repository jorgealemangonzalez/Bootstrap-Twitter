<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList" %>

<% 

List<BeanUser> list = new ArrayList<BeanUser>();

list = (List<BeanUser>) request.getAttribute("listUsers");
BeanUser user = (BeanUser)request.getAttribute("user");


%>

<div class="container col-md-6 col-md-offset-3">
	<% for(int i = 0 ; i < list.size() ; i++) { 
		BeanUser t = list.get(i);
	%>
   	<div class="row">
		<div class="card-block span4 well">
            <div class="row">
        		<div class="span1"><a href="" class="thumbnail"><img src="images/logo.jpg" height="42" width="42" alt=""></a></div>
        		<!-- TODO put ref to user page -->
        		<div class="span2">
        			<p><%=t.getUsername() %></p>
                  	<p><strong><%= t.getName()  %>  <%=t.getSurname() %></strong></p>
        			<span class=" badge badge-warning"><%=t.getUserTweets().size() %> Tweets</span>
        			<span class=" badge badge-info"><%=t.getFollowers().size() %> followers</span>
        			<%if (user.getFollowing().contains(t.getUsername())){ %>
        				<span class="badge badge-success">Following</span>
        			<%}else if(user.getUsername().compareTo(t.getUsername()) != 0){ %>
        				<span class="badge badge-warning">Follow</span>
        			<%} %>
        		</div>
        	</div>
        </div>
	</div>
 	<% } %>
	 
</div>