<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script>
 $(document).ready(function(){
	 $("p").hide();
	 
	 $("#addNewInstructor").click(function(){
		 $("addInstructorEmail").toggle();
	 });
 });
 </script>

	<h2>Manager Home Page </h2>


<button id="addNewInstructor" ><strong>Add New Instructor</strong></button>
	
	<p id="addInstructorEmail">
	<c:url var="addInstructorUrl" value="/addInstructor"/>
	<form:form method="POST" action="${addInstructorUrl}" modelAttribute="login">
	<label for="email"> Add instructor E-mail: </label>
	<form:input path="email"/>
	<fom:errors path="email" cssClass="error"></fom:errors>form:errors>
	<input type="submit" value="Add new Instructor"/>	
	</form:form>
	</p>