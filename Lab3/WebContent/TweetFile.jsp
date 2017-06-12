<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>

<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
});
</script>
<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%>



<button type="button" class="btn btn-primary pull-left"><i class="fa fa-twitter "></i> New Tweet</button>
<div class="container col-md-6 col-md-offset-3">
	<% for(int i = 0 ; i < user.getLisOfTweets().size() ; i++) { %>
		<div class="card green tweet">
			<div class="row card">
			    <div class="card-block" >
			    	 <!--Title-->
			        <h4 class="card-title"><%=user.getLisOfTweets().get(i).getUsername() %></h4>
			        <hr>
			        <!--Text-->
			        <p class="card-text"><%=user.getLisOfTweets().get(i).getTweet_text() %></p>
				</div>
			</div>
			 <!-- Card footer -->
            <div class="card-data">
                <ul>
                <!-- NO SE VEN LOS PUTOOOOOOS ICONOS -->
                    <li><i class="fa fa-clock-o" ><%=user.getLisOfTweets().get(i).getDate() %></i></li>
                   	<li><i class="fa fa-thumbs-up" aria-hidden="true"></i></li>
                </ul>
            </div>
            <!-- Card footer -->
		</div>
	<% } %>
</div>