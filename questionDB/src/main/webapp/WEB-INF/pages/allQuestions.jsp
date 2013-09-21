
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">

<head>
	<script type="text/javascript" src='<c:url value="/static/js/ckeditor/ckeditor.js" />'></script>
</head>

<body>

	<h3>All Questions</h3>
	<c:forEach var="question" items="${QuestionsList}" >
	<div>${question.content}<br>(a) ${question.option1}<br>(b) ${question.option2}<br>(c) ${question.option3}<br>(d) ${question.option4}
	</div><hr><br>
	</c:forEach>
	
</body>


</html>