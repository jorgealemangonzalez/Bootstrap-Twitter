<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet" %>

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
<<script type="text/javascript">
$(".like").click(function(event){

});
</script>


<button type="button" class="btn btn-primary pull-left"><i class="fa fa-twitter "></i> New Tweet</button>
<div class="container col-md-6 col-md-offset-3">
	<% for(int i = 0 ; i < user.getLisOfTweets().size() ; i++) { 
		BeanTweet t = user.getLisOfTweets().get(i);
	%>
		<div class="card green tweet">
			<div class="row card">
			    <div class="card-block" >
			    	 <!--Title-->
			        <h4 class="card-title"><%=t.getUsername() %></h4>
			        <hr>
			        <!--Text-->
			        <p class="card-text"><%=t.getTweet_text() %></p>
				</div>
			</div>
			 <!-- Card footer -->
            <div class="card-data">
                <ul>
<<<<<<< HEAD
                <!-- NO SE VEN LOS PUTOOOOOOS ICONOS -->
                    <li><i class="fa fa-clock-o" ><%=user.getLisOfTweets().get(i).getDate() %></i></li>
                   	<li><i class="fa fa-thumbs-up" aria-hidden="true"></i></li>
=======
                    <li><i class="fa fa-clock-o" ></i></li>
                    <%=t.getDate() %></i></li>
                   	<li><i class="fa fa-thumbs-up like" id="<%=t.getId() %>" aria-hidden="true"></i></li>
>>>>>>> 7c7a9ed8d0e563a94cbe17527331176160d9c701
                </ul>
            </div>
            <!-- Card footer -->
		</div>
	<% } %>
</div>