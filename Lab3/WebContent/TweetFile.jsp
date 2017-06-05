<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"> </script>
<!-- Include Bootstrap Datepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<!--  Javascript -->
<script type="text/javascript" src="jsController.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>


<body style="backgound-color: rgb(245, 248, 250);">
	<div class="tweet-list col-xs-4 col-sm-4 col-md-4 col-md-offset-4">
		<div class="card tweet">
		  <div class="card-block">
		  	<div class="flex-heading-container">
	  			<img src="http://d2jljza7x0a5yy.cloudfront.net/media/k2/items/cache/92ba0f2a9349e9b1fc0dfba8cc36c330_XL.jpg" height="42" width="42" alt="User Avatar" class="flex-image"/>
		  		<div class="flex-content">
				    <h4 class="card-title"><a href="#" >Jon Nieve</a></h4>
				    <h6 class="card-subtitle mb-2 text-muted">
						<span class="glyphicon glyphicon-time"></span>12 mins ago
				    </h6>
			    </div>
		    </div>
		    <p class="card-text">This is my first tweet in the music tweeter. I hope you like this kind of card.</p>
		    <a href="#" class="like-tweet" ><span class="glyphicon glyphicon-thumbs-up"></span> Like it!</a>
		  </div>
		</div>
		
		<div class="card tweet">
		  <div class="card-block">
		  	<div class="flex-heading-container">
	  			<img src="http://d2jljza7x0a5yy.cloudfront.net/media/k2/items/cache/92ba0f2a9349e9b1fc0dfba8cc36c330_XL.jpg" height="42" width="42" alt="User Avatar" class="flex-image"/>
		  		<div class="flex-content">
				    <h4 class="card-title"><a href="#" >Jon Nieve</a></h4>
				    <h6 class="card-subtitle mb-2 text-muted">
						<span class="glyphicon glyphicon-time"></span>12 mins ago
				    </h6>
			    </div>
		    </div>
		    <p class="card-text">This is my first tweet in the music tweeter. I hope you like this kind of card.</p>
		    <a href="#" class="like-tweet" ><span class="glyphicon glyphicon-thumbs-up"></span> Like it!</a>
		  </div>
		</div>
	</div>
</body>


</html>