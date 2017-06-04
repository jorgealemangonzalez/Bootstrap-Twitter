<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('#content').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>
<!-- 
<table>
<tr>
<td> <a class="menu" id="LogoutController" href=#> Logout </a> </td>
</tr>
</table>
-->

<div id="header" class="navbar-wrapper">
    <div class="container-fluid">
        <nav class="navbar navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <div>
	                    <a class="navbar-brand" href="#"><img alt="Logo" src="images/logo.jpg" height="42" width="42"/></a>
              		</div>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tweets <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="TweetFile.jsp">All tweets</a></li>
                                <li><a href="#">Only follow</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class=" dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My profile<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Public profile</a></li>
                                <li><a href="#">Account settings</a></li>
                            </ul>
                        </li>
                        <li class=""><a class="menu" id="LogoutController" href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>


