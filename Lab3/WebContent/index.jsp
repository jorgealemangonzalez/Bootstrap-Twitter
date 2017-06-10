<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<link rel="stylesheet" type="text/css" href="css/structure.css" />

<!-- Bootstrap core CSS -->
<link href="css/MDB_Free/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="css/MDB_Free/css/mdb.min.css" type="text/css" rel="stylesheet">
<!-- Material pretty design ( our modifications ) -->
<link href="css/MDB_Free/css/addons_mdb.css" type="text/css" rel="stylesheet">

</head>
<body>
<!-- SCRIPTS -->
<!--  jQuery for bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"> </script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="css/MDB_Free/js/tether.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="css/MDB_Free/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="css/MDB_Free/js/mdb.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#content').load('UserInformationController');
});
</script>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         
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
		       
		       </div>
		       <!-- End Content Column -->
			   
			   <!-- Begin Right Column -->
		       <div id="rightcolumn">
		 
		       </div>
		       <!-- End Right Column -->

         </div>	   
		 
   </div>
   <!-- End Wrapper -->
</body>
</html>