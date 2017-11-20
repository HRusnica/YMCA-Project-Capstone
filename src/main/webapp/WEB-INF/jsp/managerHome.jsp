<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Tab title -->
<c:set var="pageTitle" value="YMCA - Login & Manager"/>

<%@include file="common/header.jspf"%>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script>
 $(document).ready(function(){
	 $(".hide1").hide();
	 
	 $("#addNewInstructor").click(function(){
		 $("#addInstructorEmail").toggle();
	 });
 });
 </script>

	<h2>Manager Home Page </h2>

	<button id="addNewInstructor"><strong>Add New Instructor</strong></button>

<p >
	<c:if test="${instructor.email != null}">
		<h3>The following email has been added: <c:out value = "${instructor.email}"/></h3>
	</c:if>
	<c:url var="addInstructorUrl" value="/addInstructor" />
	<form:form method="POST" action="${addInstructorUrl}" modelAttribute="instructor">
	
		<div class ="hide1" id="addInstructorEmail">
			<label for="email">Instructor E-mail: </label>
			<form:input path="email" />
			<form:errors path="email" cssClass="error" />
			<input type="submit" value="Submit"/>
		</div>
		<div class="hide1">
			
		</div>	
		
	</form:form>
</p>

<input id="btntest" type="button" value="Add Class" 
       onclick="return btntest_onclick()" />

<script language="javascript" type="text/javascript">
function btntest_onclick() 
{
    window.location.href = "http://localhost:8080/capstone/allClasses";
}
</script>
<!-- <button type="submit" data-target="/allClasses"><strong>Add Class</strong></button> -->


<%@include file="common/footer.jspf"%>