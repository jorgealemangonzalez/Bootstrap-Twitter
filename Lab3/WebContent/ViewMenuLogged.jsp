<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<script type="text/javascript">
$(document).ready(function() {
    $(".linkController").click(function(event) {
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
                <li class="nav-item btn-group">
                    <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tweets</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <a class="dropdown-item">All tweets</a>
                        <a class="dropdown-item">My followers tweets</a>
                    </div>
                </li>
                <li class="nav-item btn-group">
                    <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <a class="dropdown-item">My account</a>
                        <a class="dropdown-item linkController" id="UserInformationController">My information</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link linkController" id="LogoutController">Log out</a>
                </li>
            </ul>
            <form class="form-inline waves-effect waves-light">
                <input class="form-control" type="text" placeholder="Search">
            </form>
        </div>
    </div>
</nav>
<!--/.Navbar-->



