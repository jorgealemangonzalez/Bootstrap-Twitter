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


<div class="container col-md-6 col-md-offset-3">
	<div class="row card">
	    <div class="card-block" id ="repeat"> <!-- Offset to center it , col-widnow-size to select the size of the component depending on the window size -->
			<div class="md-form">
				<% for(int i = 0 ; i < user.getLisOfTweets().size() ; i++) { %>
						<p><%=user.getLisOfTweets().get(i).getTweet_text() %> <p>
                <% } %>
			</div>
		</div>
	</div>
</div>