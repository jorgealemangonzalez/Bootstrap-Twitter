<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList" %>
    

<% 

List<BeanTweet> list = new ArrayList<BeanTweet>();

list = (List<BeanTweet>) request.getAttribute("listTweets");


BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%>
<script type="text/javascript">
$(".like").click(function(event){

});
</script>


<div class="container col-md-6 col-md-offset-3">
	<% if(list.size() == 0){ %>
		<div class="card">
		    <div class="card-header danger-color-dark white-text">
		        Tweets not found
		    </div>
		    <div class="card-block">
		        <h4 class="card-title">There are no tweets</h4>
		        <p class="card-text">There are no tweets that match what you are looking for</p>
		    </div>
		</div>
	<%} %>
	<% for(BeanTweet t : list) { 
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
                    <li><i class="fa fa-clock-o" ></i></li>
                    <%=t.getDate() %>
                   	<li><i class="fa fa-thumbs-up like" id="<%=t.getId() %>" aria-hidden="true"></i></li>
                </ul>
            </div>
            <!-- Card footer -->
		</div>
	<% } %>
</div>