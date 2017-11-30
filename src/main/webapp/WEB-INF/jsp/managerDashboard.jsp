<%@include file="common/managerDashboardHeader.jspf"%>  

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/addInstructor.jpeg" var="addInstructor"/> 
              <img src="${addInstructor}" width="200" height="200" class="img-responsive" alt="Add Instructor" data-toggle="modal" data-target="#newInstructor-modal">
             
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/ScheduleNewClass.jpeg" var="ScheduleNewClass"/>
              <c:url value="/scheduleClass" var="scheduleLink"/>
              <a href="${scheduleLink}"> <img src="${ScheduleNewClass}" width="200" height="200" class="img-responsive" alt="Schedule New Class"></a>
              
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
			  <c:url value="/img/addStudentToClass.jpeg" var="addStudentToClassImage"/>
              <img src="${addStudentToClassImage}" width="200" height="200" class="img-responsive" alt="Add Student To Class" data-toggle="modal" data-target="#addStudentToClass-modal">
             
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/newStudent.jpeg" var="newStudentImage"/>
              <img src="${newStudentImage}" width="200" height="200" class="img-responsive" alt="New Student" data-toggle="modal" data-target="#newStudent-modal">
          
            </div>
          </div>

          <h2 class="sub-header">Current Class Schedule</h2>
          <div class="table-responsive">
            <table class="table table-striped">
             <thead>
                <tr>
                  <th>Class Name</th>
                  <th>Instructor</th>
                  <th>Age Group</th>
                  <th>Day of Week</th>
                  <th>Time</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${allScheduledClassesByManager}" var="classes">
                <!--  SHOW ALL CLASSES FROM ALL INSTRUCTORS -->
                <tr data-level-name="${classes.levelName}" data-age-group="${classes.ageGroup}" data-toggle="modal" data-target="#att-modal" >
                  <td><c:out value="${classes.levelName }" /></td>
                  <td><c:out value="${classes.instructorFullName }" /></td>
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

    
<!-- ADD STUDENT TO CLASS MODAL BELOW -->  
<div id="addStudentToClass-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Enroll Student</h2>
        <h4 class="modal-sub-title">Use this form to add a student to a scheduled class</h4>
        
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
  	  
  	  <div class="modal-body">
	      <label for="selectedClass">Select Class</label>
	      <select id="addToClassClassId" name="className" class="form-control">
	      	<option value="">Select a Class</option>
	      	<c:forEach var="classes" items="${allScheduledClassesByManager}">
	        	<option value="${classes.levelId}"><c:out value="${classes.levelName} ${classes.ageGroup} - ${classes.instructorFullName }"/></option>
	       	</c:forEach>
	      </select>
	 </div>
	 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="addStudentToClassButton" onclick="addStudentToClass()">Enroll Student</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  
    
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

<!-- ADD NEW INSTRUCTOR MODAL BELOW -->
<div id="newInstructor-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>New Instructor</h2>
        <h4 class="modal-sub-title">Use this form to save an instructor in the database</h4>
      </div>
      
      <div class="modal-body">
      <label for="email">Email</label>
      	<input id="emailInstructor" class="form-control"></input>
  	  </div>
  	  
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="newInstructorButton" onclick="saveNewInstructor()">Save Instructor</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%@include file="common/footer.jspf"%>  
