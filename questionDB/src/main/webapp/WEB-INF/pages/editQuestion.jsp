
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
					<li class="active"><a href="<c:url value='/home'/>">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Questions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/questions/viewAll'/>">Physics</a></li>
							<li><a href=#>Mathematics</a></li>
						</ul>
					</li>
					<li><a href="<c:url value='/branch/new'/>">Configuration</a></li>
				</ul>


			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		<div class="page-header">
			<h2>${subject_string} Questions</h2>
			<h4>${message}</h4>
		</div>




	</div>

	<div class="container ">

		<c:url var="addQ" value="/questions/updateQuestion" />
		<form:form method="POST" action="${addQ}" modelAttribute="QUESTION" class="form-inline">
			<%-- 		<form:label path="topic">Topic:</form:label><form:select items="${TOPIC_LIST}" itemLabel="name" itemValue="name" path="topic"/>&nbsp; --%>
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="topic" class="sr-only">Topic:</form:label> --%>
<%-- 				<form:input path="topic" class="typeahead form-control" id="topic" --%>
<%-- 					placeholder="Enter Topic" /> --%>
<!-- 			</div>&nbsp;&nbsp;&nbsp; -->
			
			<b>Topic:</b>
			<div class="form-group">
				<form:label path="topic"></form:label>
				<form:select path="topic" id="topic" class="form-control" placeholder="">
					<form:option value="NONE" label="Select a Topic" />
					<form:options items="${TOPIC_LIST}" itemValue="name" itemLabel="name" />
				</form:select>
			&nbsp;&nbsp;&nbsp;
			</div>
			
			
			<b>Sub Topic:</b>
			<div class="form-group">
				<form:label path="subTopic"></form:label>
				<form:select path="subTopic" id="subTopic" class="form-control" >
<%-- 					<form:option value="NONE" label="--- Select ---" /> --%>
<%-- 					<form:options items="${TOPIC_LIST}" itemValue="name" itemLabel="name" /> --%>
				</form:select>
			&nbsp;&nbsp;&nbsp;
			</div>
			
			<b>Concept:</b>
			<div class="form-group">
				<form:label path="conceptsList"></form:label>
				<form:select path="conceptsList" id="conceptsList" class="form-control">
<%-- 					<form:option value="NONE" label="--- Select ---" /> --%>
<%-- 					<form:options items="${TOPIC_LIST}" itemValue="name" itemLabel="name" /> --%>
				</form:select>
			&nbsp;&nbsp;&nbsp;
			</div>




<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="subTopic" class="sr-only">Sub Topic:</form:label> --%>
<%-- 				<form:input path="subTopic" class="typeahead form-control" id="subTopic" --%>
<%-- 					placeholder="Enter Sub Topic" /> --%>
<!-- 			</div> -->
<!-- 			&nbsp;&nbsp;&nbsp; -->
<!-- 			<div class="form-group"> -->
<%-- 				<form:label path="conceptsList" class="sr-only" >Concepts:</form:label> --%>
<%-- 				<form:input path="conceptsList" class="typeahead form-control" id="concepts"  --%>
<%-- 					placeholder="Enter Concepts" /> --%>
<!-- 			</div> -->
<!-- 			&nbsp;&nbsp;&nbsp; -->
			
			<b>Difficulty:</b>
			<div class="form-group">
				<form:label path="difficulty"></form:label>
				<form:select path="difficulty" class="form-control" placeholder="">
					<form:option value="VERY_EASY" label="Very Easy" />
					<form:option value="EASY" label="Easy" />
					<form:option value="MODERATE" label="Moderate" />
					<form:option value="DIFFICULT" label="Difficult" />
					<form:option value="VERY_DIFFICULT" label="Very Difficult" />
				</form:select>
				&nbsp;&nbsp;&nbsp;
			</div>
			
			
			
			&nbsp;&nbsp;&nbsp;<b>Key:</b>
			<!--  <div class="form-group">
				<form:label path="key"></form:label>
				<form:select path="key" class="form-control" placeholder="">
					<form:option value="A" label="A" />
					<form:option value="B" label="B" />
					<form:option value="C" label="C" />
					<form:option value="D" label="D" />
				</form:select>
				&nbsp;&nbsp;&nbsp;
			</div>-->
			<div class="form-group">
				<form:label path="key" class="checkbox-inline">
					<form:checkbox path="key" value="A" />A
				</form:label>
			
				<form:label path="key" class="checkbox-inline">
					<form:checkbox path="key" value="B" />B
				</form:label>
				<form:label path="key" class="checkbox-inline">
					<form:checkbox path="key" value="C" />C
				</form:label>
				<form:label path="key" class="checkbox-inline">
					<form:checkbox path="key" value="D" />D
				</form:label>
			</div>
			<br>
			<hr>			
			<div class="form-group">
				<form:label path="exam" class="sr-only">Exam:</form:label>
				<form:input path="exam" class="typeahead form-control" id="exam"
					placeholder="Enter Exam" />
			</div>
			&nbsp;&nbsp;&nbsp;
			
			<div class="form-group">
				<form:label path="year" class="sr-only">Year:</form:label>
				<form:input path="year" class="typeahead form-control" id="year"
					placeholder="Year" />
			</div>
			&nbsp;&nbsp;&nbsp;
			<hr>
			
						

			<br>
			<br>
			<label for="id">Id:</label>
			<br>
			<input id="id" name="id" readonly="readonly" value="${QUESTION_ID}">
			<br>
			
			<label for="content">Content:</label>
			<br>
			<textarea id="content" name="content">${CONTENT}</textarea>
			<br>
			<label for="option1">Option 1:</label>
			<br>
			<textarea id="option1" name="option1">${OPTION1}</textarea>
			<br>
			<label for="option2">Option 2:</label>
			<br>
			<textarea id="option2" name="option2">${OPTION2}</textarea>
			<br>
			<label for="option3">Option 3:</label>
			<br>
			<textarea id="option3" name="option3">${OPTION3}</textarea>
			<br>
			<label for="option4">Option 4:</label>
			<br>
			<textarea id="option4" name="option4">${OPTION4}</textarea>
			<br>
			<label for="solution">Solution</label>
			<br>
			<textarea id="solution" name="solution"></textarea>
			<br>
			<input type="submit" value="Submit" />

		</form:form>


	</div>





	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							
							$('#topic').change(function(){
								var topicName = $('#topic').val();
								var topicId = topicName.replace(/\s/g,'');
								var branchId = '${subject_string}';
																				
								$.ajax({
									url:'${pageContext.request.contextPath}/branch/'+'Physics'+'/'+topicId+'/subTopics',
									type:"GET",
									success:function(response){
										//alert('response'+response);
										//alert('Branch Name'+branchName);
										//alert('response length'+response.length);
									
										
										
										var subTopicList = '<option value="">Select a sub topic</option>';
										for(var i=0;i<response.length;i++){
											subTopicList += '<option value="' + response[i].name + '">'+ response[i].name + '</option>';
														
										}
										
										//subTopicList+='</option>';
										$('#subTopic').html(subTopicList);
										
									}
									
									
								});
								
								
								
							});
							
							
							
							$('#subTopic').change(function(){
								var topicName = $('#topic').val();
								var topicId = topicName.replace(/\s/g,'');
								var subTopicName = $('#subTopic').val();
								var subTopicId = subTopicName.replace(/\s/g,'');
								
								$.ajax({
								url:'${pageContext.request.contextPath}/branch/'+'Physics'+'/'+topicId+'/'+subTopicId+'/concepts',
								type:"GET",
								success:function(response){
									//alert('response'+response);
									//alert('Branch Name'+branchName);
									//alert('response length'+response.length);
									var conceptList = '<option value="">Select a concept</option>';
									for(var i=0;i<response.length;i++){
										conceptList += '<option value="' + response[i].name + '">'+ response[i].name + '</option>';
													
									}
									
									
									$('#conceptsList').html(conceptList);
									
									}
								});
								
							
							
							
							});
							
							
							

// 							$('#topic').typeahead( {
// 								name : 'topics',
// 								remote : '${pageContext. request. contextPath}/configuration/topicListByName?term=%QUERY',
// 							} );
							
// 							$('#subTopic').typeahead( {
// 								name : 'subTopics',
// 								remote : '${pageContext. request. contextPath}/configuration/subTopicListByName?term=%QUERY',
// 							} );
						
							$('#concepts').typeahead( {
								name : 'concepts',
								remote : '${pageContext. request. contextPath}/configuration/conceptListByName?term=%QUERY',
							} );
						
							$('#exam').typeahead( {
								name : 'exams',
								remote : '${pageContext. request. contextPath}/configuration/examListByName?term=%QUERY',
							} );
							
							var years = [];
							
							for (var i = 1970; i <= 2020; i++) {
								   years.push(i.toString());
								}
							
							$('#year').typeahead( {
								name : 'year',
								local: years
							} );
							
							
						});
// 		$("#subTopic").focus( function () {
// 		    //$('#url_title').val('/personal-trainer-directory/'+$(this).val().toLowerCase().replace(/ +/g, '-').trim());
// 		    alert('inside subtopic');
// 		});
	</script>

	<script type="text/javascript">
		CKEDITOR.replace('content');
		CKEDITOR.replace('option1', {
			//width : "400px"
		});
		CKEDITOR.replace('option2', {
			//width : "400px"
		});
		CKEDITOR.replace('option3', {
			//width : "400px"
		});
		CKEDITOR.replace('option4', {
			//width : "400px"
		});
		CKEDITOR.replace('solution');
	</script>
	<script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static/js/holder.js' />"></script>
<!-- 	<script type="text/javascript" -->
<%-- 		src='<c:url value="/static/js/jquery.js" />'></script> --%>
<!-- 	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
</body>


</html>