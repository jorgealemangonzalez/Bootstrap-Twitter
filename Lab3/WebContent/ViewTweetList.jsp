<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList" %>
    

<% 

List<BeanTweet> list = new ArrayList<BeanTweet>();

list = (List<BeanTweet>) request.getAttribute("listTweets");


BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}

String lastAction = "getAllTweets";
if(request.getAttribute("lastAction") != null){
	lastAction = (String)request.getAttribute("lastAction");
}
%>
<script type="text/javascript">
$(".like").click(function(event){

});

$('.edit').click(function(event){
	var target = event.target;
	var tweetId = $(target.parentElement.parentElement.parentElement.parentElement).attr("tweetID");
	if(document.getElementById("newText") == null){
		var ident = "editable"+tweetId;
		var edit = document.getElementById(ident);
		edit.removeChild(document.getElementById("inputText"+tweetId));
		var newText = document.createElement("input");
		newText.setAttribute("id","newText");
		edit.appendChild(newText);
	}else{
		var text = document.getElementById("newText").value;	
		$.post('TweetsController',{action: "editTweet", input: text, id: tweetId},function(data,status){
			if(status != 401){
				console.log("AAA");
				console.log("${lastAction}");
				$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
					if(status != 401){
						$('#content').html(data);
					}
				});
			}
		} );
	}
	
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
		<div class="card green tweet" username="<%=t.getUsername()%>" tweetID="<%=t.getId()%>">
			<div class="row card" >
			    <div class="card-block" >
			    	 <!--Title-->
			    	<ul class="metrics inline-ul">
			   		 <h4 class="card-title"><%=t.getUsername() %></h4>
					</ul>
			        <hr>
			        <!--Text-->
		        	<div class="card-text " id="editable<%=t.getId()%>">
		        		<p id="inputText<%=t.getId()%>"> <%=t.getTweet_text() %></p>
		    		 	<i class="edit fa fa-pencil fa-pull-right " aria-hidden="true">Submit</i>
		        	</div>
		         	
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