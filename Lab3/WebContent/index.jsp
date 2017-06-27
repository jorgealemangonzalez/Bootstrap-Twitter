<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="models.BeanUser"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<link rel="stylesheet" type="text/css" href="css/structure.css" />

<!-- Font awesome icons -->
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="css/MDB_Free/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="css/MDB_Free/css/mdb.min.css" type="text/css" rel="stylesheet">
<!-- Material pretty design ( our modifications ) -->
<link href="css/MDB_Free/css/addons_mdb.css" type="text/css" rel="stylesheet">


</head>
<body style="background-color:rgb(245, 248, 250)">
<!-- SCRIPTS -->
<script type="text/javascript" src="jsController.js"></script> 
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
	$('#content').load('ContentController');
	$('#navigation').load('MenuController');
});
</script>



<div id="navigation">
	 			   
</div>
	
<div id="content">
	
</div>

</body>
</html>