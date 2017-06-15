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
	<% for(int i = 0 ; i < list.size() ; i++) { 
		BeanTweet t = list.get(i);
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