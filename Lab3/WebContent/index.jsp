<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"> </script>
<!--  jQuery for bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<title> Template Register Form (Validation HTML5) </title>
</head>
<body>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <nav id="header" class="navbar navbar-default">
			 <div class="container-fluid">
			   <!-- Brand and toggle get grouped for better mobile display -->
			   <div class="navbar-header">
			     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			       <span class="sr-only">Toggle navigation</span>
			       <span class="icon-bar"></span>
			       <span class="icon-bar"></span>
			       <span class="icon-bar"></span>
			     </button>
			     <a class="navbar-brand" href="#">Brand</a>
			   </div>
			
			   <!-- Collect the nav links, forms, and other content for toggling -->
			   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			     <ul class="nav navbar-nav">
			       <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
			       <li><a href="#">Link</a></li>
			       <li class="dropdown">
			         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
			         <ul class="dropdown-menu">
			           <li><a href="#">Action</a></li>
			           <li><a href="#">Another action</a></li>
			           <li><a href="#">Something else here</a></li>
			           <li role="separator" class="divider"></li>
			           <li><a href="#">Separated link</a></li>
			           <li role="separator" class="divider"></li>
			           <li><a href="#">One more separated link</a></li>
			         </ul>
			       </li>
			     </ul>
			     <form class="navbar-form navbar-left">
			       <div class="form-group">
			         <input type="text" class="form-control" placeholder="Search">
			       </div>
			       <button type="submit" class="btn btn-default">Submit</button>
			     </form>
			     <ul class="nav navbar-nav navbar-right">
			       <li><a href="#">Link</a></li>
			       <li class="dropdown">
			         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
			         <ul class="dropdown-menu">
			           <li><a href="#">Action</a></li>
			           <li><a href="#">Another action</a></li>
			           <li><a href="#">Something else here</a></li>
			           <li role="separator" class="divider"></li>
			           <li><a href="#">Separated link</a></li>
			         </ul>
			       </li>
			     </ul>
			   </div><!-- /.navbar-collapse -->
			 </div><!-- /.container-fluid -->
			</nav>
		 <!-- End Header -->
		 
		 <!-- Begin Navigation -->
         <div id="navigation">
		 
	     <jsp:include page="ViewMenuNotLogged.jsp" />
			   
		 </div>
		 <!-- End Navigation -->
		 
         <!-- Begin Faux Columns -->
		 <div id="faux">
		 
		       <!-- Begin Left Column -->
		       <div id="leftcolumn">
		 
		       </div>
		       <!-- End Left Column -->
		 
		       <!-- Begin Content Column -->
		       <div id="content">
		       
		       <jsp:include page="ViewLoginForm.jsp" />
	  		       			  
		       </div>
		       <!-- End Content Column -->
			   
			   <!-- Begin Right Column -->
		       <div id="rightcolumn">
		 
		       </div>
		       <!-- End Right Column -->

         </div>	   
         <!-- End Faux Columns --> 

         <!-- Begin Footer -->
         <div id="footer">
		       
               This is the Footer		

         </div>
		 <!-- End Footer -->
		 
   </div>
   <!-- End Wrapper -->
</body>
</html>