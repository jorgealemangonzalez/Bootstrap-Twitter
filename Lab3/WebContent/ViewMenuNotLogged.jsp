<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<script type="text/javascript">
$(document).ready(function() {
    $(".nav-link").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>


<!--Navbar-->
<nav class="navbar navbar-toggleable-md navbar-dark bg-primary green">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#collapseEx12" aria-controls="collapseEx2" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#"><img alt="Logo" src="images/logo.jpg" height="42" width="42"/></a>
        <div class="collapse navbar-collapse" id="collapseEx12">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" id="LoginController">Log in <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="UserInformationController" >Log as Anonymous</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="RegisterController">Register</a>
                </li>
            </ul>
            <form class="form-inline waves-effect waves-light">
                <input class="form-control" type="text" placeholder="Search">
            </form>
        </div>
    </div>
</nav>
<!--/.Navbar-->
