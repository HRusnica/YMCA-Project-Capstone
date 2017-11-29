<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/skillAccomplished.js"></script>
    <script type="text/javascript">
			$(document).ready(function() {
				
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
				
			});
					
		</script>
		
<title>Instructor Dashboard</title>

<!-- Bootstrap core CSS -->
<c:url value="/css/bootstrap.min.css" var="cssBootstrap"/>
<link href="${cssBootstrap}" rel="stylesheet">
    
<!-- Custom styles for this template -->
<c:url value="/css/dashboard.css" var="cssDashboard" />
<link href="${cssDashboard}" rel="stylesheet">
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">YMCA Swim</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:url var="logoutAction" value="/logoutInstructor" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" />
							</form>
							<li><a id="logoutLink" href="#">Log Out</a></li>
					<!-- <li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li> -->
				</ul>
				<!--<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>-->
			</div>
		</div>
	</nav>


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<c:url value="/instructorDashboard" var="instructorDashboard" />
					<li><a href="${instructorDashboard}">Overview </a></li>
					<c:url value="/instructorViewClasses"
						var="instructorViewClassesLink" />
					<li class="active"><a href="${instructorViewClassesLink}">View
							My Classes<span class="sr-only">(current)</span>
					</a></li>

				</ul>
				<ul class="nav nav-sidebar">
					<li><strong>LINKS</strong></li>
					<c:url value="http://www.ymca.net/" var="ymcaLink" />
					<li><a href="${ymcaLink}">YMCA</a></li>
					<c:url
						value="http://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/water-safety/swim-safety"
						var="swimSafety" />
					<li><a href="${swimSafety}">Swim Safety Tips</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<!--  <li><a href="">Another nav item</a></li>-->
				</ul>
			</div>		
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
				
				<h1 class="page-header">Introduced Skills</h1>

						<table class="table table-striped" id="addAccomplishedSkillTable">
						
						<tbody>
						
						<c:forEach items="${skillList}" var="skill">
							
							<c:url var="formAction" value="/introducedSkills" />
							<form method="POST" action="${formAction}">
								<tr>
								<td>
									<label for="${skill.skillId}"><c:out value="${skill.skillName}" /> </label>
									<c:out value="${skill.skillDescription}"/>
								</td>
								<td>
									<c:choose>
									<c:when test="${skill.introduced == true}">
										<input type="checkbox" id="${skill.skillId}" name="introduced" value="true" checked >  Introduced
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="${skill.skillId}" name="introduced" value="true" >  Introduced
									</c:otherwise>
									</c:choose>
								</td>
								<td>
									<input type="hidden" name="classId" value="${classId}">
									<input type="hidden" name="skillId" value="${skill.skillId} ">
									<button type="submit" value="submit">Save Introduced Skill</button>	
								</td>
							<div id="accomplished">
							<td data-skill-name="${skill.skillName}" data-toggle="modal" data-target="#addAccomplishedSkill-modal">Skill Accomplished
							</div>
								
						
						</tr>
						</form>
						
					</c:forEach>
						
					</tbody>
					</table>
			
				
</div>
</div>
</div>


<!-- SKILL ACCOMPLISHED MODAL -->  
<div id="addAccomplishedSkill-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Skill Accomplished</h2>
        <h4 class="modal-title">Use this form to updated a student skill to accomplished</h4>
        <input type="hidden" id="skillId" name="skillId">
      <h3 class ="modal-sub-title">Skill</h3>
      </div>
      
      <div class="modal-body">
	      <label for="selectedStudent">Select Student</label>
	      <select id="addToClassStudentId" name="studentName" class="form-control">
	      	<option value="">Select a student</option>
	      	<c:forEach var="student" items="${allStudents}">
	        	<option value="${student.studentId }"><c:out value="${student.firstName} ${student.lastName}"/></option>
	       	</c:forEach>
	      </select>
	 </div>
	 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveSkillAccomplishedButton" onclick="saveSkillAccomplished()">Update Student File</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

		
				
</body>
</html>
