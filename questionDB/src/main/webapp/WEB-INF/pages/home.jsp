
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



	</div>
	<hr>
	<div class="container" style="text-align: justify;">
		<div class="row">
			<div class="col-md-4">
				<img class="img-rounded" src="data:image/png;base64,"
					data-src="holder.js/300x200" alt="Generic placeholder image">
				<h2>Physics</h2>
				<p></p>
				<p>
					<a class="btn btn-primary" href="<c:url value='/questions/P/createQuestion'/>">Create Questions&raquo;</a><br><br>
					<a class="btn btn-primary" href="#">Edit Questions&raquo;</a>
				</p>
			</div>
			<div class="col-md-4">
				<img class="img-rounded" src="data:image/png;base64,"
					data-src="holder.js/300x200" alt="Generic placeholder image">
				<h2>Mathematics</h2>
				<p></p>
				<p>
					<a class="btn btn-primary" href="#">Create Questions&raquo;</a><br><br>
					<a class="btn btn-primary" href="#">Edit Questions&raquo;</a>
				</p>

			</div>
			<div class="col-md-4">
				<img class="img-rounded" src="data:image/png;base64,"
					data-src="holder.js/300x200" alt="Generic placeholder image">
				<h2>Chemistry</h2>
				<p></p>
				<p>
					<a class="btn btn-primary" href="#">Create Questions&raquo;</a><br><br>
					<a class="btn btn-primary" href="#">Edit Questions&raquo;</a>
				</p>
			</div>
		</div>
	</div>
	<hr>
<footer>
<p>© KayKaySea 2013</p>
</footer>
	<script src="<c:url value='/static/js/jquery.js' />"></script>
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static/js/holder.js' />"></script>	
</body>


</html>