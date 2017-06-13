<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanTweet , java.util.List" %>
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
});
</script>
<% 
BeanTweet bTweet = new BeanTweet();
%>


<div class="container col-md-6 col-md-offset-3">
	<% List<BeanTweet> list = bTweet.loadAllTweetsFromDB();
		for(int i = 0 ; i < list.size() ; i++) { %>
		<div class="card green tweet">
			<div class="row card">
			    <div class="card-block" >
			    	 <!--Title-->
			        <h4 class="card-title"><%=list.get(i).getUsername() %></h4>
			        <hr>
			        <!--Text-->
			        <p class="card-text"><%=list.get(i).getTweet_text()%></p>
				</div>
			</div>
			 <!-- Card footer -->
            <div class="card-data">
                <ul>
                <!-- NO SE VEN LOS PUTOOOOOOS ICONOS -->
                    <li><i class="fa fa-clock-o" ></i></li>
                    <li><i class="fa fa-twitter"> <%=list.get(i).getDate() %></i></li>
                   	<li><i class="fa fa-thumbs-up" aria-hidden="true"></i></li>
                </ul>
            </div>
            <!-- Card footer -->
		</div>
	<% } %>
</div>