
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
<script src="<c:url value='/static/js/jquery.js' />"></script>
<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/static/js/typeahead.min.js' />"></script>
<script src="<c:url value='/static/js/bootstrap-tagsinput.js' />"></script>
<script type="text/javascript"
	src='<c:url value="/static/js/ckeditor/ckeditor.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/static/js/bootstrap-editable.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/static/js/util.js" />'></script>	
<title>Questions Page</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/static/css/bootstrap-theme.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/typeahead-fix.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/sticky-footer-navbar.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/bootstrap-tagsinput.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/bootstrap-editable.css' />"
	rel="stylesheet">
<link href="<c:url value='/static/css/custom.css' />"
	rel="stylesheet">

<script type="text/javascript"
	src='<c:url value="/static/js/x-edit-main.js" />'></script>
<script type="text/javascript">


$(document)
.ready(
		function() {

			$('#branchForm')
					.submit(
							function(event) {
								var name = $('#branchName').val();
								var json = {
									"name" : name
								};

								$
										.ajax({
											url : '${pageContext.request.contextPath}/questions/search',
											data : JSON
													.stringify(json),
											type : "POST",
											beforeSend : function(
													xhr) {
												xhr
														.setRequestHeader(
																"Accept",
																"application/json");
												xhr
														.setRequestHeader(
																"Content-Type",
																"application/json");
											},
											success : function(
													branch) {
												loadBranches();
												$('#branchName').val('');

											}
										});

								event.preventDefault();

							});
			
			
			$('#searchBtn')
			.click(
					function(event) {
						
					loadQuestions();	


					});
	
			
			
			
			
			
			
			
		});





</script>


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

	

	<div class="container ">

		<div style="width: 900px" class="row">

			<div class="col-lg-12">
				<div class="input-group" style="text-align: c">
					<input type="text" class="form-control" id="searchText"> <span
						class="input-group-btn">
						<button class="btn btn-default" type="button" id="searchBtn">Search</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>





		</div>

	</div>

	<div class="container ">
		<div class="row">
			<div id="questionList" class="col-md-12">
		
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>


	
	<script src="<c:url value='/static/js/holder.js' />"></script>

</body>


</html>