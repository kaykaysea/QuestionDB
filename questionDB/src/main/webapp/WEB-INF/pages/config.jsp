<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>

</head>

<body>
	<c:url var="addTopic" value="/configuration/addTopic" />
	<c:url var="addSubTopic" value="/configuration/addSubTopic" />
	<c:url var="addConcept" value="/configuration/addConcept" />
	<c:url var="addExam" value="/configuration/addExam" />
	<p>Click <a href="<c:url value='/questions/createQuestion' />">here</a> to go to the create question Page</p>
	<hr>
	
	<div style="width: 900px;">
		<div style="width: 200px; float: left;">
			<form:form action="${addTopic}" modelAttribute="TOPIC">
				<p>${TopicMessage}</p>
				<form:label path="name">Topic name:</form:label>
				<form:input path="name" />
				<input type="submit" value="Submit">
			</form:form>
			<hr>
			<p>Available topics</p>
			<ol>
				<c:forEach var="topic" items="${TOPIC_LIST}">
					<li>${topic.name}</li>
				</c:forEach>
			</ol>
		</div>

		<div style="width: 200px; float: left;">
			<form:form action="${addSubTopic}" modelAttribute="SUBTOPIC">
				<p>${SubTopicMessage}</p>
				<form:label path="name">Subtopic name:</form:label>
				<form:input path="name" />
				<input type="submit" value="Submit">
			</form:form>
			<hr>
			<p>Available subtopics</p>
			<ol>
				<c:forEach var="subtopic" items="${SUBTOPIC_LIST}">
					<li>${subtopic.name}</li>
				</c:forEach>
			</ol>
		</div>

		<div style="width: 200px; float: left;">
			<form:form action="${addConcept}" modelAttribute="CONCEPT">
				<p>${ConceptMessage}</p>
				<form:label path="name">Concept name:</form:label>
				<form:input path="name" />
				<input type="submit" value="Submit">
			</form:form>
			<hr>
			<p>Available Concepts</p>
			<ol>
				<c:forEach var="concept" items="${CONCEPT_LIST}">
					<li>${concept.name}</li>
				</c:forEach>
			</ol>

		</div>
		
		
		<div style="width: 200px; float: left;">
			<form:form action="${addExam}" modelAttribute="EXAM">
				<p>${ExamMessage}</p>
				<form:label path="name">Exam name:</form:label>
				<form:input path="name" />
				<input type="submit" value="Submit">
			</form:form>
			<hr>
			<p>Available Exams</p>
			<ol>
				<c:forEach var="exam" items="${EXAM_LIST}">
					<li>${exam.name}</li>
				</c:forEach>
			</ol>

		</div>

	</div>




</body>


</html>