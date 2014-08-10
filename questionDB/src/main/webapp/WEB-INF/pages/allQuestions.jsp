
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

	<div class="container">
		<div class="row">
			<div id="" class="col-md-12">
				<h3>All Questions</h3>
					<c:set var="count" value="0" scope="page" />
					<c:forEach var="question" items="${QuestionsList}" >
					<c:set var="count" value="${count + 1}" scope="page"/>
					<div><b>${count}. </b>${question.content}<br>(a) ${question.option1}<br>(b) ${question.option2}<br>(c) ${question.option3}<br>(d) ${question.option4}<br><br>
					<a href="<c:url value='/questions/edit/${question.id}'/>" class='btn btn-primary btn-small active' role='button'>Edit</a>
					<a href="<c:url value='/questions/delete/${question.id}'/>" class='btn btn-primary btn-small active' role='button'>Delete</a>
					</div><hr><br>
				</c:forEach>
			
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