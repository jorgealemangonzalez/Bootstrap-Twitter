<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList" %>
    

<% 

List<BeanTweet> list = new ArrayList<BeanTweet>();

list = (List<BeanTweet>) request.getAttribute("listTweets");


BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}

String action = "getAllTweets";
if(request.getAttribute("action") != null){
	action = (String)request.getAttribute("action");
}

%>
<script type="text/javascript">
$(".like").click(function(event){

});

$('.edit').click(function(event){
	if(document.getElementById("newText") == null){
		var edit = document.getElementById("editable");
		var newText = document.createElement("input");
		edit.removeChild(document.getElementById("inputText"));
		newText.setAttribute("id","newText");
		edit.appendChild(newText);
	}else{
		var text = document.getElementById("newText").value;
		console.log(text);
		$.post('TweetsController',{action: "editTweet", input: text},function(data,status){
			if(status != 401){
				$.get('TweetsController',{action: "${ction}"}, function(data,status){
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
		<div class="card green tweet" username="<%=t.getUsername()%>">
			<div class="row card">
			    <div class="card-block" >
			    	 <!--Title-->
			    	<ul class="metrics inline-ul">
			   		 <h4 class="card-title"><%=t.getUsername() %></h4>
					</ul>
			        <hr>
			        <!--Text-->
		        	<div class="card-text " id="editable">
		        		<p id="inputText"> <%=t.getTweet_text() %></p>
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