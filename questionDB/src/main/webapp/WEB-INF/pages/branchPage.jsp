
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

<script type="text/javascript"
	src='<c:url value="/static/js/x-edit-main.js" />'></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('#branchForm').submit(function(event){
		var name = $('#branchName').val();
		var json = {"name":name};
		
		$.ajax({
			url:'${pageContext.request.contextPath}/branch/create',
			data:JSON.stringify(json),
			type:"POST",
			beforeSend: function(xhr) {  
	            xhr.setRequestHeader("Accept", "application/json");  
	            xhr.setRequestHeader("Content-Type", "application/json");  
	        },  
			success: function(branch){
				$.ajax({
					url:'${pageContext.request.contextPath}/branch/all',
					type:"GET",
					success:function(response){
						
						var branchList = "<ol>";
						var branchName = '';
						for(var i=0;i<response.length;i++){
							branchName = response[i].name.replace(/'/g, "\\'");
							//branchId = response[i].name.toString();
							branchId = response[i].id.toString();
							branchList += '<li><a href="javascript:viewTopics('+'\''+branchId+'\''+','+'\''+branchName+'\''+')">'+response[i].name+'</a>';
										
						}
						
						branchList+="</ol>";
						$('#branchResponse').html(branchList);
					}
				});

			}
		});
	
		event.preventDefault();	
		
	});
	
	
	$('#topicForm').submit(function(event){
		var name = $('#topicName').val();
		var topicId = generateUUID()+'t';
		var json = {"name":name,"id":topicId};
		var branchId = $('#branchId').text();
				
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
		var subTopicId = generateUUID()+'st';
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
		var conceptId = generateUUID()+'c';
		var json = {"name":conceptName,"id":conceptId};
		var branchId = $('#branchId').text();
		var topicId = $('#topicId').text();
		var topicId_enc = encodeURIComponent(topicId);
		var topicName = $('#topicNameHolder').html();
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


function viewTopics(branchId,branchName){
	$('#topicContainer').show();
	$('#subTopicContainer').hide();
	$('#conceptContainer').hide();
	//alert('BranchId'+branchId);
	$('#branchId').text(branchId);
	$.ajax({
		url:'${pageContext.request.contextPath}/branch/'+branchId+'/topics',
		type:"GET",
		success:function(response){
			//alert('response'+response);
			//alert('Branch Name'+branchName);
			//alert('response length'+response.length);
			var topicList = "<h4>Topics for "+branchName+"</h4><ol>";
			for(var i=0;i<response.length;i++){
				
				
				topicList += '<li><a href="javascript:viewSubTopics('+'\''+response[i].id.replace(/'/g, "\\'")+'\''+','+'\''+response[i].name.replace(/'/g, "\\'")+'\''+')">'+response[i].name+'</a>';
							
			}
			
			topicList+="</ol>";
			$('#topicResponse').html(topicList);
			
		}
		
		
	});
	
}


function viewSubTopics(topicId,topicName){
	$('#subTopicContainer').show();
	$('#conceptContainer').hide();
	$('#topicId').text(topicId);
	$('#topicNameHolder').html(topicName);
	var branchId = $('#branchId').text();
	$.ajax({
		url:'${pageContext.request.contextPath}/branch/'+branchId+'/'+topicId+'/subTopics',
		type:"GET",
		success:function(response){
			//alert('response'+response);
			//alert('Branch Name'+branchName);
			//alert('response length'+response.length);
			var subTopicList = "<h4>Sub Topics for "+topicName+"</h4><ol>";
			for(var i=0;i<response.length;i++){
				subTopicList += '<li><a href="javascript:viewConcepts('+'\''+response[i].id.replace(/'/g, "\\'")+'\''+','+'\''+response[i].name.replace(/'/g, "\\'")+'\''+')">'+response[i].name+'</a>';
							
			}
			
			subTopicList+="</ol>";
			$('#subTopicResponse').html(subTopicList);
			
		}
		
		
	});
	
}


function viewConcepts(subTopicId,subTopicName){
	$('#conceptContainer').show();
	$('#subTopicId').html(subTopicId);
	$('#subTopicNameHolder').html(subTopicName);
	var branchId = $('#branchId').text();
	var topicId = $('#topicId').text();
	$.ajax({
		url:'${pageContext.request.contextPath}/branch/'+branchId+'/'+topicId+'/'+subTopicId+'/concepts',
		type:"GET",
		success:function(response){
			//alert('response'+response);
			//alert('Branch Name'+branchName);
			//alert('response length'+response.length);
			var conceptList = "<h4>Concepts for "+subTopicName+"</h4><ol>";
			for(var i=0;i<response.length;i++){
				conceptList += '<li><a href=#>'+response[i].name+'</a>';
							
			}
			
			conceptList+="</ol>";
			$('#conceptResponse').html(conceptList);
			
		}
		
		
	});
	
}




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
	<div class="container">
		
			



	</div>
   
	<div class="container ">
		
		<div style="width: 900px;" class="row">
			<div  id="branchContainer" class="form-group col-md-3">
				<form:form modelAttribute="BRANCH" id="branchForm" >
					<form:label path="name" for="branchName">Branch :</form:label>
					<form:input path="name"  id="branchName" class="form-control" /><br>
					<input type="submit" value="Submit" class="btn">
				</form:form>
				<hr>
				<h4>Branches</h4>
				<div id="branchResponse">
					
					<ol>
						<c:forEach var="branch" items="${BRANCH_LIST}">
							<li><a href="javascript:viewTopics('${branch.id}','${branch.name}')">${branch.name}</a></li>
						</c:forEach>
					</ol>
					
				</div>
			</div>
			
			<div id="branchId" style="display:none;" ></div>
			
			
			<div id="topicContainer" class="form-group col-md-3" style="display: none">
				<form:form modelAttribute="TOPIC" id="topicForm">
					<form:label path="name">Topic :</form:label>
					<form:input path="name" id="topicName" class="form-control"/><br>
					<input type="submit" value="Submit" class="btn">
				</form:form>
				<hr>
				
				<div id="topicResponse">
					

					
				</div>
				
			</div>
			
			
			<div id="topicId" style="display:none;" ></div>
			<div id="topicNameHolder" style="display:none;" ></div>
			
			
			
			
			<div id="subTopicContainer" class="form-group col-md-3" style="display:none">
				<form:form modelAttribute="SUBTOPIC" id="subTopicForm">
					<form:label path="name">Sub Topic :</form:label>
					<form:input path="name" id="subTopicName" class="form-control"/><br>
					<input type="submit" value="Submit" class="btn">
				</form:form>
				<hr>
				
				<div id="subTopicResponse">
					

					
				</div>
				
			</div>
			
			<div id="subTopicId" style="display:none;" ></div>
			<div id="subTopicNameHolder" style="display:none;" ></div>
			
			
			
			<div id="conceptContainer" class="form-group col-md-3" style="display:none">
				<form:form modelAttribute="CONCEPT" id="conceptForm">
					<form:label path="name">Concepts:</form:label>
					<form:input path="name" id="conceptName" class="form-control"/><br>
					<input type="submit" value="Submit" class="btn">
				</form:form>
				<hr>
				
				<div id="conceptResponse">
					

					
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