<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Tab title -->
<c:set var="pageTitle" value="YMCA - Login & Manager"/>

<%@include file="common/header.jspf"%>

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

	<c:url var="addInstructorUrl" value="/addInstructor" />
	<form:form method="POST" action="${addInstructorUrl}" modelAttribute="instructor">
	
		<div>
			<label for="email">Instructor E-mail: </label>
			<form:input path="email" />
			<form:errors path="email" cssClass="error" />
		</div>
		<div>
			<input type="submit" value="Submit"/>
		</div>	
		
	</form:form>
</p>

<%@include file="common/footer.jspf"%>