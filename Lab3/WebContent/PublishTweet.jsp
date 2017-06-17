<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanTweet" %>

<% 
BeanTweet bTweet = new BeanTweet();
%>
<script>
$(document).ready(function() {  
	$('#publishTweet').click(function(event){
		var text = $('#tweet_text').val()
		$.post('TweetsController',{tweet_text : text, action: "publishTweet"},function(data, status){
			if(status != 401){
				alert("Tweet added to your profile")
				$('#content').load('ContentController');
				$('#navigation').load('MenuController');
			}else
	        	alert("Error while logout: Data: " + data + "\nStatus: " + status);
		})
	});
});

</script>


<!--Form without header-->
<div class="container col-md-6 col-md-offset-3">
	<div class="card">
		    <div class="card-block">
		        <div class="text-center">
		            <h3><i class="fa fa-pencil"></i> Publish a Tweet:</h3>
		            <hr class="mt-2 mb-2">
		        </div>
		
		        <!--Body-->

		         <div class="md-form">
		           	<input class="form-control" type="text" id="tweet_text"/>
		            <label for="tweet_text">What are you thinking?</label>
	  	        </div>
		
		
		        <div class="text-center" id="publishTweet">
		            <button class="btn btn-lg btn-success" >Publish</button>
		        </div>
		
		    </div>
	</div>
</div>
<!--/Form without header-->
