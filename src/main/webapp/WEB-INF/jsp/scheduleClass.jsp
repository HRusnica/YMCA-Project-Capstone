<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Assign Instructor to a Class</title>
<link rel="shortcut icon" type="image/x-icon" href="http://www.techelevator.com/favicon.ico" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/assignClass.js"></script>
</head>
<body>


	<div class="container">
	<h1>Available Classes</h1>
		<table class="table table-striped table-hover" id="allClassesTable">
			<tbody>
			<thead>
				<tr>
					<th>Class Name</th>
					<th>Class Level</th>
				</tr>
			</thead>
				
				<c:forEach items="${allClasses}" var="classes">
					<tr data-level-id="${classes.levelId}" data-level-name="${classes.levelName}" data-age-group="${classes.ageGroup}" data-toggle="modal" data-target="#class-modal">
						<td><strong><c:out value="${classes.levelName}"/></strong></td>
						<td><c:out value="${classes.ageGroup}"/></td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>

<!-- MODAL BELOW -->
<div id="class-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>New Class Form</h2>
        <h3 class="modal-title">Modal title</h3>
        <h4 class="modal-sub-title">Modal subtitle</h4>
      </div>
      
      <div class="modal-body">
      <label for="selectInstructor">Select Instructor</label>
      <select name="assignedInstructor" class="form-control">
      <c:forEach var="instructor" items="${allInstructors}">
        <option value="${instructor.instructorId }"><c:out value="${instructor.firstName + ' ' + instructor.lastName}"/></option>
       	</c:forEach>
       	</select>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="dayOfWeek">Day Of Week</label>
      <select name="assignDayOfWeek" class="form-control">
		<option value="Sunday">Sunday</option>
       	<option value="Monday">Monday</option>
       	<option value="Tuesday">Tuesday</option>
       	<option value="Wednesday">Wednesday</option>
       	<option value="Thursday">Thursday</option>
       	<option value="Friday">Friday</option>
       	<option value="Saturday">Saturday</option>
       	</select>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="time">Class Time</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="startDate">Start Date</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="endDate">End Date</label>
      	<input id="time" class="form-control"></input>
  	  </div>
  	  
  	  <div class="modal-body">
      <label for="notes">Class Notes</label>
      	<textarea id="notes" class="form-control"></textarea>
  	  </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->