<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<h2>Manager Home Page </h2>

	<c:url var="addInstructorUrl" value="/addInstructor"/>
	<form:form method="POST" action="${addInstructorUrl}" modelAttribute="login">

	<input type="submit" value="Add new Instructor"/>	

	</form:form>