<%@include file="common/instructorDashboardHeader.jspf"%>  		
			
				
				<h1>Introduced Skills</h1>

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
							
							<td data-skill-name="${skill.skillName}" data-toggle="modal" data-target="#addAccomplishedSkill-modal">Skill Accomplished</td>
							</tr>
						</form>
						
					</c:forEach>
						
					</tbody>
					</table>
			


<!-- SKILL ACCOMPLISHED MODAL -->  
<div id="addAccomplishedSkill-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Skill Accomplished</h2>
        <h4 class="modal-title">Use this form to updated a student skill to accomplished</h4>
        <input type="hidden" id="addAccomplishedSkillId" name="skillId" value="${skill.skillId}">
      <h3 class ="modal-sub-title">Skill</h3>
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
        <button type="button" class="btn btn-primary" id="saveSkillAccomplishedButton" onclick="saveAccomplishedSkill()">Update Student File</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

		
<%@include file="common/footer.jspf"%>  				


