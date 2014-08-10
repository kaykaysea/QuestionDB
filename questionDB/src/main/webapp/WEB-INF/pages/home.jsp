
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
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/static/css/bootstrap-theme.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/sticky-footer-navbar.css' />"
	rel="stylesheet">
<link href="<c:url value="/static/css/font-awesome.min.css"/>" rel="stylesheet">
</head>


<body>

    <!-- Top fixed menu start -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/home'/>">QuesDB</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				</ul>
				<ul class="nav navbar-nav navbar-right">
			
					
					<li><a title="Create Question" href="<c:url value='/questions/create'/>"><span class="glyphicon glyphicon-edit"></span></a></li>
					<li><a title="View all questions" href="<c:url value='/questions/viewAll'/>"><span class="glyphicon glyphicon-list-alt"></span></a></li>
					<li><a title="Search questions" href="<c:url value='/questions/search'/>"><span class="glyphicon glyphicon-search"></span></a></li>
					<li><a title="Configuration" href="<c:url value='/branch/edit'/>"><span class="glyphicon glyphicon-wrench"></span></a></li>
				</ul>


			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	 <!-- Top fixed menu end -->
	 
	 
	 
	<div class="container"></div>
	<hr>
	<div class="container" style="text-align: center;">
		<div class="row col-md-12">
			<div class="col-md-4">
			<h1 style="font-size: 100px;"><a title="Create Question" href="<c:url value='/questions/create'/>"><span class="glyphicon glyphicon-edit"></span></a></h1>
				
			</div>
			<div class="col-md-4">
			<h1 style="font-size: 100px;"><a title="View all questions"  href="<c:url value='/questions/viewAll'/>"><span class="glyphicon glyphicon-list-alt"></span></a></h1>	

			</div>
			<div class="col-md-4">
			<h1 style="font-size: 100px;"><a title="Search questions" href="<c:url value='/questions/search'/>"><span class="glyphicon glyphicon-search"></span></a></h1>
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