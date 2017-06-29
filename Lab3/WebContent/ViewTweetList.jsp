<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser,models.BeanTweet,java.util.List,java.util.ArrayList,models.BeanCommentary" %>
    

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
	var target = event.target;
	console.log(target);
	var tweetId = $(target).attr("tweetID");
	$.post('TweetsController',{action: "likeTweet", id: tweetId},function(data,status){
		if(status != 401){
			$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
				if(status != 401){
					$('#content').html(data);
				}
			});
		}
	} );
});

$(".unlike").click(function(event){
	var target = event.target;
	console.log(target);
	var tweetId = $(target).attr("tweetID");
	$.post('TweetsController',{action: "unlikeTweet", id: tweetId},function(data,status){
		if(status != 401){
			$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
				if(status != 401){
					$('#content').html(data);
				}
			});
		}
	} );
});

$('.edit').click(function(event){
	var target = event.target;
	var tweetId = $(target.parentElement.parentElement.parentElement.parentElement).attr("tweetID");
	var ident = "editable"+tweetId;
	var edit = document.getElementById(ident);
	var oldText = document.getElementById("inputText"+tweetId);
	var oldSubmit = document.getElementById("editTweet"+tweetId);
	var save = document.getElementById("saveTweet"+tweetId);
	oldSubmit.setAttribute("style","display:none;");
	save.setAttribute("style"," ");
	var newText = document.createElement("input");
	//var newText = document.createElement("textarea");
	var oldTextAtt = $("#inputText"+tweetId).text();
	newText.setAttribute("id","inputText"+tweetId);
	newText.setAttribute("value",oldTextAtt);
	newText.setAttribute("style","width: 400px");
	edit.removeChild(oldText);
	edit.insertBefore(newText,edit.firstChild);	
});

$('.save').click(function(event){
	var target = event.target;
	var tweetId = $(target.parentElement.parentElement.parentElement.parentElement).attr("tweetID");
	var text = document.getElementById("inputText"+tweetId).value;
	$.post('TweetsController',{action: "editTweet", input: text, id: tweetId},function(data,status){
		if(status != 401){
			$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
				if(status != 401){
					$('#content').html(data);
				}
			});
		}
	} );
});

$('.remove').click(function(event){
	var target = event.target;
	var tweetId = $(target.parentElement.parentElement.parentElement.parentElement).attr("tweetID");
	$.post('TweetsController',{action: "deleteTweet", id: tweetId},function(data,status){
		if(status != 401){
			$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
				if(status != 401){
					$('#content').html(data);
				}
			});
		}
	})
});

$('.comment').click(function(event){
	var tweetId = $(event.target).attr("tweetID");
	var commentary = $('#comment'+tweetId).val();
	console.log("Comment: ");
	console.log(tweetId);
	console.log(commentary);
	$.post('TweetsController',{action: "commentTweet", id: tweetId, comment: commentary },function(data,status){
		if(status != 401){
			$.get('TweetsController',{action: "${lastAction}"}, function(data,status){
				if(status != 401){
					$('#content').html(data);
				}
			});
		}
	})
});
jQuery(document).ready(function($){
	 $("abbr.timeago").timeago()
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
		        		<% if(t.getUsername().compareTo(user.getUsername()) == 0 || user.isAdmin()) { %>
			    		 	<i class="edit fa fa-pencil fa-pull-right " aria-hidden="true" id="editTweet<%=t.getId()%>">Edit</i>
			    		 	<i style="display:none;" class="save fa fa-save fa-pull rigth" id ="saveTweet<%=t.getId() %>" >Save</i>
			    		 	<i class="remove fa fa-trash fa-pull right" id="deleteTwet<%=t.getId()%>">Delete</i>
			    		 <% } %>
		        	</div>
		         	
				</div>
			</div>
			 <!-- Card footer -->
            <div class="card-data">
                <ul>
                    <li><i class="fa fa-clock-o" ></i> <abbr style="width:100%; color:white;" class="timeago" title="<%=t.getDate() %>"></abbr></li>
                   	<% if(t.getLikes().contains(user.getUsername())){ %>
                 		<li><a class="btn btn-warning btn-sm unlike" tweetID="<%=t.getId() %>"><i class="fa fa-thumbs-down" tweetID="<%=t.getId() %>" aria-hidden="true"></i><%=t.getLikes().size() %></a></li>
                   	
                   	<%}else{ %>
                   		<li><a class="btn btn-success btn-sm like" tweetID="<%=t.getId() %>"><i class="fa fa-thumbs-up" tweetID="<%=t.getId() %>" aria-hidden="true"></i><%=t.getLikes().size() %></a></li>
                	<%} %>
                </ul>
                <% if(t.getCommentarys().size() > 0){ %>
                <ul style="text-align:left;">
                	<div class="list-group">
                		<a class="list-group-item active">
                		Comments:
                		</a>
               		<% for(BeanCommentary comment : t.getCommentarys()){%>
                
					    <a class="list-group-item" style="color:black;">
					        <h4 style="width:100%;"><%= comment.getUser_username() %></h3><br>
		                	<p style="width:100%;"> <%= comment.getCommentary() %></p><br>
							<abbr style="width:100%;text-align:right; " class="timeago" title="<%=comment.getDate() %>"></abbr>		
						</a>
                
                	<%} %>
                	</div>
                </ul>
                <%} %>
                <br>
                <input style="color:white;" type="text" placeholder="Comment" id="comment<%=t.getId()%>"/><button class="comment btn btn-success btn-sm" tweetID="<%=t.getId() %>">send</button>
            </div>
            <!-- Card footer -->
		</div>
		
		
	<% } %>
</div>