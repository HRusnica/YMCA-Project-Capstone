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
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/newStudent.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <title>Manager Dashboard</title>

    <!-- Bootstrap core CSS -->
    <c:url value="/css/bootstrap.min.css" var="cssBootstrap"/>
    <link href="${cssBootstrap}" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <c:url value="/css/dashboard.css" var="cssDashboard"/>
    <link href="${cssDashboard}" rel="stylesheet">
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">YMCA Swim</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <c:url value="/managerDashboard" var="managerDashboard"/>
            <li class="active"><a href="${managerDashboard}">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">All Classes</a></li>
            
          </ul>
          <ul class="nav nav-sidebar">
            <li><strong>LINKS</strong></li>
            <c:url value="http://www.ymca.net/" var="ymcaLink"/>
            <li><a href="${ymcaLink}">YMCA</a></li>
            <c:url value="http://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/water-safety/swim-safety" var="swimSafety"/>
            <li><a href="${swimSafety}">Swim Safety Tips</a></li>
          </ul>
          <ul class="nav nav-sidebar">
           	<li><strong>RESOURCES</strong></li>
           	<c:url value="/img/StagesOfLearning.pdf" var="SOLpdf"/>
           	<li><a href="${SOLpdf}">Stages of Learning</a></li>
           	
           	<c:url value="/img/LessonSelector.pdf" var="lessonpdf"/>
            <li><a href="${lessonpdf}">Lesson Selector</a></li>
            
            <c:url value="/img/StageDescription.pdf" var="stagepdf"/>
            <li><a href="${stagepdf}">Stage Descriptions</a></li>
            
            <c:url value="/img/programOverview.pdf" var="programpdf"/>
            <li><a href="${programpdf}">Program Overview</a></li> 
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Manager Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/addInstructor.jpeg" var="addInstructor"/> 
              <img src="${addInstructor}" width="200" height="200" class="img-responsive" alt="Add Instructor">
              <!--<span class="text-muted">Add Instructor's email to Database</span>-->

				<p >
					<c:if test="${instructor.email != null}">
						<p>The following email has been added: <c:out value = "${instructor.email}"/></p>
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
           
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/ScheduleNewClass.jpeg" var="ScheduleNewClass"/>
              <c:url value="/scheduleClass" var="scheduleLink"/>
              <a href="${scheduleLink}"> <img src="${ScheduleNewClass}" width="200" height="200" class="img-responsive" alt="Schedule New Class"></a>
              <!--<span class="text-muted">View all Classes</span>-->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
			  <c:url value="/img/addParent.jpeg" var="addParentImage"/>
              <img src="${addParentImage}" width="200" height="200" class="img-responsive" alt="Add Parent">
              <!--<span class="text-muted">Add Parent email to Database</span>-->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/newStudent.jpeg" var="newStudentImage"/>
              <img src="${newStudentImage}" width="200" height="200" class="img-responsive" alt="New Student" data-toggle="modal" data-target="#newStudent-modal">
              <!--  <span class="text-muted">Enroll a new Student</span>-->
            </div>
          </div>

          <h2 class="sub-header">Current Class Schedule</h2>
          <div class="table-responsive">
            <table class="table table-striped">
             <thead>
                <tr>
                  <th>Class Name</th>
                  <th>Age Group</th>
                  <th>Day of Week</th>
                  <th>Time</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${allScheduledClasses}" var="classes">
                <!--  SHOW ALL CLASSES FROM ALL INSTRUCTORS -->
                <tr data-level-name="${classes.levelName}" data-age-group="${classes.ageGroup}" data-toggle="modal" data-target="#att-modal" >
                  <td><c:out value="${classes.levelName }" /></td>
                  <td><c:out value="${classes.ageGroup }" /></td>
                  <td><c:out value="${classes.dayOfWeek }" /></td>
                  <td><c:out value="${classes.hour }" /></td>
                  <td><c:out value="${classes.startDate }" /></td>
                  <td><c:out value="${classes.endDate }" /></td>
                  </tr>
                  </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    
<!-- ADD NEW STUDENT MODAL BELOW -->
<div id="newStudent-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>New Student</h2>
        <h4 class="modal-sub-title">Use this form to save a student in the database</h4>
      </div>
      
      <div class="modal-body">
      <label for="firstName">First Name</label>
      	<input id="firstNameStudent" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="lastName">Last Name</label>
      	<input id="lastNameStudent" class="form-control"></input>
  	  </div>
      
  	  <div class="modal-body">
      <label for="gender">Gender</label>
      <select name="gender" class="form-control" id="genderStudent">
      	<option value="not specified">Not Specified</option>
		<option value="male">Male</option>
       	<option value="female">Female</option>
      </select>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="birthday">Birthday (YYYY-MM-DD)</label>
      	<input id="birthdayStudent" class="form-control"></input>
  	  </div>
  	  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="newStudentButton" onclick="saveNewStudent()">Save Student</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

