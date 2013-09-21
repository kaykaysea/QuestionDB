
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../assets/ico/favicon.png">

<title>Physics Question Database</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/static/css/bootstrap-theme.min.css' />" rel="stylesheet">
<link href="<c:url value='/static/css/sticky-footer-navbar.css' />"rel="stylesheet">

</head>


<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">QuesDB</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
<!-- 					<li class="dropdown"><a href="#" class="dropdown-toggle" -->
<!-- 						data-toggle="dropdown">Dropdown <b class="caret"></b></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="#">Action</a></li> -->
<!-- 							<li><a href="#">Another action</a></li> -->
<!-- 							<li><a href="#">Something else here</a></li> -->
<!-- 							<li class="divider"></li> -->
<!-- 							<li class="dropdown-header">Nav header</li> -->
<!-- 							<li><a href="#">Separated link</a></li> -->
<!-- 							<li><a href="#">One more separated link</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Questions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href=#>Physics</a></li>
							<li><a href=#>Mathematics</a></li>						
						</ul>
					</li>
				</ul>
				
				
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
		<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Navbar example</h1>
			<p>This example is a quick exercise to illustrate how the
				default, static and fixed to top navbar work. It includes the
				responsive CSS and HTML, so it also adapts to your viewport and
				device.</p>
			<p>To see the difference between static and fixed top navbars,
				just scroll.</p>
			<p>
				<a class="btn btn-lg btn-primary" href="../../components/#navbar">View
					navbar docs &raquo;</a>
			</p>
		</div>

	</div>
	<hr>
<footer>
<p>© Company 2012</p>
</footer>
	<script src="<c:url value='/static/js/jquery.js' />"></script>
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static/js/holder.js' />"></script>	
</body>


</html>