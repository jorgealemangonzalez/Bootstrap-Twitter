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


<body>
	<div class="panel-body">
	      <ul class="chat">
	          <li class="left clearfix"><span class="chat-img pull-left">
	              <img src="images/logo.jpg" height="42" width="42" alt="User Avatar" class="img-circle" />
	          </span>
	              <div class="chat-body clearfix">
	                  <div class="header">
	                      <strong class="primary-font">Username</strong> <small class="pull-right text-muted">
	                          <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
	                  </div>
	                  <p>This is a tweet
	                  </p>
	              </div>
	          </li>
	           <li class="left clearfix"><span class="chat-img pull-left">
	              <img src="images/logo.jpg" height="42" width="42" alt="User Avatar" class="img-circle" />
	          </span>
	              <div class="chat-body clearfix">
	                  <div class="header">
	                      <strong class="primary-font">Username 1 </strong> <small class="pull-right text-muted">
	                          <span class="glyphicon glyphicon-time"></span>15 mins ago</small>
	                  </div>
	                  <p>This is another tweet </p>
	              </div>
	          </li>
          </ul>
</body>


</html>