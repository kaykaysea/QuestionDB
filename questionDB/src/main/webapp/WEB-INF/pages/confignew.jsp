
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
<script src="<c:url value='/static/js/typeahead.min.js' />"></script>
<script src="<c:url value='/static/js/bootstrap-tagsinput.js' />"></script>
<script type="text/javascript"
	src='<c:url value="/static/js/ckeditor/ckeditor.js" />'></script>
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

<script type="text/javascript">

// 	$(document).ready(function(){
		
// 		 $('#branchForm').submit(function(e) {
// 		        // will pass the form data using the jQuery serialize function
// 		        $.post('${pageContext.request.contextPath}/configuration/new/branch', $(this).serialize(), function(response) {
// 		          $('#branchFormResponse').text(response);
// 		          alert(response);
// 		        });
		         
// 		        e.preventDefault(); // prevent actual form submit and page reload
// 		      });

		
// 	}
			
// 	);

function saveBranch(){
	$.ajax({
           type: "post",
           url: '${pageContext.request.contextPath}/configuration/new/branch',
           cache: false,
           dataType:"json",
           data: $('#branchForm').serialize(),
           //alert(response);
           success: function(response){
        	   alert('response');
        	   $('#branchFormResponse').html("");
        	   var obj =  JSON.parse(response);
        	   $('#branchFormResponse').html(obj);
           }
		
	});
	
	
	
}



</script>


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
					<li><a href="<c:url value='/configuration/'/>">Configuration</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Questions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href=#>Physics</a></li>
							<li><a href=#>Mathematics</a></li>
						</ul></li>
				</ul>


			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		




	</div>
<%-- 	<c:url var="addBranch" value="/configuration/addTopic" /> --%>
	<div class="container ">
	<div style="width: 900px;">
		<div style="width: 200px; float: left;">
			<form:form modelAttribute="BRANCH" id="branchForm">
				<p>${TopicMessage}</p>
				<form:label path="name">Branch :</form:label>
				<form:input path="name" />
				<input type="submit" value="Submit" onclick="saveBranch();">
			</form:form>
			<hr>
			<div id="branchFormResponse">
				
				
			</div>
		</div>
		

	</div>

	</div>



	<script type="text/javascript">

	</script>


	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static/js/holder.js' />"></script>

</body>


</html>