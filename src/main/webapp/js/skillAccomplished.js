var root = 'http://localhost:8080/capstone/';

var addAccomplishedSkillURL = '/addAccomplishedSkill';

$(function(){
	$('#addAccomplishedSkill-modal').modal({
		keyboard: true,
        backdrop: "static",
        show:false,
	});
});

function addStudentToClass(){
	$.ajax({
		url: root + addAccomplishedSkillURL,
		method: "POST",
		data: {
			'skillId' : $("#addAccomplishedSkillId").val(),
			'studentId' : $("#addAccomplishedStudentId").val()
		}
	
	}).done(function(data){
		alert("The skill has been updated to accomplished.");
		$("#skillId").val("");
		$("#studentId").val("");
	})
};

<!-- ADD STUDENT TO CLASS MODAL BELOW -->  
<div id="addAccomplishedSkill-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Skill Accomplished</h2>
        <h3>"${studentSkill.thisSkill.skillName}"</h3>
        <h4 class="modal-sub-title">Use this form to updated a student skill to accomplished</h4>
        <input type="hidden" id="skillId" name="skillId">
      </div>
      
      <div class="modal-body">
	      <label for="selectedStudent">Select Student</label>
	      <select id="addAccomplishedStudentId" name="studentName" class="form-control">
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