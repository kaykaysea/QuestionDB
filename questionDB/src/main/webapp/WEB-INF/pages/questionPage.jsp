
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

$(document).ready(function(){
	
	$('#questionBtn').click(function(event){
		var id = $('#questionId').val();
		var editBtn = "<a href='${pageContext.request.contextPath}/questions/edit/"+id+"' class='btn btn-primary btn-small active' role='button'>Edit Question</a>";
		$.ajax({
			url:'${pageContext.request.contextPath}/questions/'+id,
			type:"GET",
			dataType:"json",
			contentType:"application/json",
			success: function(response){
			$('#questionIdx').show();
			$('#questionContent').html(response.content);
			$('#questionTopic').html(response.topic);
			$('#questionSubTopic').html(response.SubTopic);
			$('#questionOption1').html('(a)'+response.option1);
			$('#questionOption2').html('(b)'+response.option2);
			$('#questionOption3').html('(c)'+response.option3);
			$('#questionOption4').html('(d)'+response.option4);
			$('#questionExam').html(response.exam);
			$('#questionDifficulty').html(response.difficulty);
			$('#questionKey').html(response.key);
			$('#questionYear').html(response.year);
			$('#questionEditButton').html(editBtn);

			}
		});
	
		event.preventDefault();	
		
	});
	
	
	$('#topicForm').submit(function(event){
		var name = $('#topicName').val();
		var topicId = name.replace(/\s/g,'');
		var json = {"name":name,"id":topicId};
		var branchId = $('#branchId').text();
		//alert(branchId);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/branch/'+branchId+'/addTopic',
			data:JSON.stringify(json),
			type:"POST",
			beforeSend: function(xhr) {  
	            xhr.setRequestHeader("Accept", "application/json");  
	            xhr.setRequestHeader("Content-Type", "application/json");  
	        },  
			success: function(branch){
				$.ajax({
					url:'${pageContext.request.contextPath}/branch/'+branch.id+'/topics',
					type:"GET",
					success:function(response){
						
						var topicList = "<h4>Topics for "+branch.name+"</h4><ol>";
						for(var i=0;i<response.length;i++){
							topicList += '<li><a href="javascript:viewSubTopics('+'\''+response[i].id.replace(/'/g, "\\'")+'\''+','+'\''+response[i].name.replace(/'/g, "\\'")+'\''+')">'+response[i].name+'</a>';
										
						}
						
						topicList+="</ol>";
						$('#topicResponse').html(topicList);
						$('#topicName').val('');
					}
				});

			}
		});
	
		event.preventDefault();	
		
	});
	
	
	
	$('#subTopicForm').submit(function(event){
		var name = $('#subTopicName').val();
		var subTopicId = name.replace(/\s/g,'');
		var json = {"name":name,"id":subTopicId};
		var branchId = $('#branchId').text();
		var topicId = $('#topicId').text();
		var topicId_enc = encodeURIComponent(topicId);
		//alert(topicId+','+topicId_enc);
		var topicName = $('#topicNameHolder').html();
		//alert(branchId);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/branch/'+branchId+'/'+topicId_enc+'/addSubTopic',
			data:JSON.stringify(json),
			type:"POST",
			beforeSend: function(xhr) {  
	            xhr.setRequestHeader("Accept", "application/json");  
	            xhr.setRequestHeader("Content-Type", "application/json");  
	        },  
			success: function(branch){
				$.ajax({
					url:'${pageContext.request.contextPath}/branch/'+branch.id+'/'+topicId_enc+'/subTopics',
					type:"GET",
					success:function(response){
						
						var subTopicList = "<h4>Sub Topics for "+topicName+"</h4><ol>";
						for(var i=0;i<response.length;i++){
							subTopicList += '<li><a href="javascript:viewConcepts('+'\''+response[i].id.replace(/'/g, "\\'")+'\''+','+'\''+response[i].name.replace(/'/g, "\\'")+'\''+')">'+response[i].name+'</a>';
										
						}
						
						subTopicList+="</ol>";
						$('#subTopicResponse').html(subTopicList);
						$('#subTopicName').val('');
					}
				});

			}
		});
	
		event.preventDefault();	
		
	});
	
	
	$('#conceptForm').submit(function(event){
		var conceptName = $('#conceptName').val().replace('\'','&quot');
		var conceptId = conceptName.replace(/\s/g,'');
		var json = {"name":conceptName,"id":conceptId};
		var branchId = $('#branchId').text();
		var topicId = $('#topicId').text();
		var topicId_enc = encodeURIComponent(topicId);
		var subTopicId = $('#subTopicId').text();
		var subTopicId_enc = encodeURIComponent(subTopicId);
		var subTopicName = $('#subTopicNameHolder').html();
		//alert(branchId);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/branch/'+branchId+'/'+topicId_enc+'/'+subTopicId_enc+'/addConcept',
			data:JSON.stringify(json),
			type:"POST",
			beforeSend: function(xhr) {  
	            xhr.setRequestHeader("Accept", "application/json");  
	            xhr.setRequestHeader("Content-Type", "application/json");  
	        },  
			success: function(branch){
				$.ajax({
					url:'${pageContext.request.contextPath}/branch/'+branch.id+'/'+topicId_enc+'/'+subTopicId_enc+'/concepts',
					type:"GET",
					success:function(response){
						
						var conceptList = "<h4>Concepts for "+subTopicName+"</h4><ol>";
						for(var i=0;i<response.length;i++){
							conceptList += '<li><a href=#>'+response[i].name+'</a>';
										
						}
						
						conceptList+="</ol>";
						$('#conceptResponse').html(conceptList);
						$('#conceptName').val('');
					}
				});

			}
		});
	
		event.preventDefault();	
		
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
					<li><a href="<c:url value='/branch/edit'/>">Configuration</a></li>
				</ul>


			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

 
	<div class="container ">
		
		<div style="width: 900px;" class="row">
			<div  id="branchContainer" class="form-group col-md-12">
				
					<label  for="questionId">Question ID:</label>
					<input  id="questionId" class="form-control" /><br>
					<input type="submit" value="Submit" class="btn" id="questionBtn">
				
				<hr>
				<h4>Question</h4>
					
				<div id="questionIdx" style="display:none;" >
					<div id="questionContent"></div>
					<div id="questionOption1"></div>
					<div id="questionOption2"></div>
					<div id="questionOption3"></div>
					<div id="questionOption4"></div>
					
					<div id="questionTopic"></div>
					<div id="questionSubTopic"></div>
					<div id="questionConcept"></div>
					<div id="questionExam"></div>
					<div id="questionDifficulty"></div>
					<div id="questionKey"></div>
					<div id="questionYear"></div>
					<div id="questionEditButton"><a href="" class="btn btn-primary btn-small active" role="button">Edit Question</a></div>
					
					
					
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