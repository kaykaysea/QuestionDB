
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>
	<script type="text/javascript" src='<c:url value="/static/js/ckeditor/ckeditor.js" />'></script>
</head>

<body>
	<h3>Questions Page</h3>
	<p>${message}</p>
	<p>Click <a href="<c:url value='/configuration/'/>">here</a> to go to the configurations page</p>
	<c:url var="addQ" value="/questions/addQuestion" />
	<form:form method="POST" action="${addQ}" modelAttribute="QUESTION">
		<form:label path="topic">Topic:</form:label><form:select items="${TOPIC_LIST}" itemLabel="name" itemValue="name" path="topic"/>&nbsp;
		<form:label path="subTopic">Sub Topic:</form:label><form:select items="${SUBTOPIC_LIST}" itemLabel="name" itemValue="name" path="subTopic"/>&nbsp;
		<form:label path="difficulty">Difficulty:</form:label><form:select path="difficulty">
														<form:option value="VERY_EASY" label="Very Easy"/>
														<form:option value="EASY" label="Easy"/>
														<form:option value="MODERATE" label="Moderate"/>
														<form:option value="DIFFICULT" label="Difficult"/>
														<form:option value="VERY_DIFFICULT" label="Very Difficult"/>
												 </form:select>&nbsp;
		<form:label path="concepts">Concepts:</form:label><form:input path="concepts" size="30" /><br><br>
		<form:label path="content">Content:</form:label><br><form:textarea path="content"/><br>
		<form:label path="option1">Option 1:</form:label><br><form:textarea path="option1"/><br>
		<form:label path="option2">Option 2:</form:label><br><form:textarea path="option2"/><br>
		<form:label path="option3">Option 3:</form:label><br><form:textarea path="option3"/><br>
		<form:label path="option4">Option 4:</form:label><br><form:textarea path="option4"/><br>
		<input type="submit" value="Submit"/>
	
	</form:form>
	
	
	<script type="text/javascript">
		CKEDITOR.replace('content');
		CKEDITOR.replace('option1',{width:"400px"});
		CKEDITOR.replace('option2',{width:"400px"});
		CKEDITOR.replace('option3',{width:"400px"});
		CKEDITOR.replace('option4',{width:"400px"});
	</script>
</body>


</html>