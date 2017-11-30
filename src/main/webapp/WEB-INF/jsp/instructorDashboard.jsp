<%@include file="common/instructorDashboardHeader.jspf"%>  

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/StagesOfLearning.jpeg" var="SOLimage"/>
              <c:url value="/img/StagesOfLearning.pdf" var="SOLpdf"/>
              <a href="${SOLpdf}" target="_blank"><img src="${SOLimage}" width="200" height="200" class="img-responsive" alt="Stages of Learning button"></a>
          	  <!--<h5 class="text-muted">View pdf</h5> -->
	
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/lessonSelector.jpeg" var="lessonimage"/>
              <c:url value="/img/LessonSelector.pdf" var="lessonpdf"/>
              <a href="${lessonpdf}" target="_blank"><img src="${lessonimage}"width="200" height="200" class="img-responsive" alt="Lesson Selector button"></a>
              <!--<h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>-->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/stageDesc.jpeg" var="stageDescimage"/>
              <c:url value="/img/StageDescription.pdf" var="stagepdf"/>
              <a href="${stagepdf}" target="_blank"><img src="${stageDescimage}" width="200" height="200" class="img-responsive" alt="Stage Description button"></a>
              <!--<h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span>-->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <c:url value="/img/programOverview.jpeg" var="programOverviewimage"/>
              <c:url value="/img/programOverview.pdf" var="programpdf"/>
              <a href="${programpdf}" target="_blank"><img src="${programOverviewimage}" width="200" height="200" class="img-responsive" alt="Program Overview button"></a>
              <!-- <h4>Place Holder</h4>
              <span class="text-muted">Place Holder information</span> -->
            </div>
          </div>

          <h2 class="sub-header">My Classes</h2>
          <div class="table-responsive">
            <table class="table table-striped" id="attTable">
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
                <tr data-class-id="${classes.classId}" data-level-name="${classes.levelName}" data-age-group="${classes.ageGroup}" data-toggle="modal" data-target="#att-modal" >
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
    
    
<!-- ATTENDANCE MODAL BELOW -->
<div id="att-modal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h2>Attendance</h2>
        <h3 class="modal-title">Modal title</h3>
        <h4 class="modal-sub-title">Modal subtitle</h4>
      </div>
		    
		    <div class="modal-body">
		    	<c:forEach var="student" items="${allStudents }">
		    	<div class="checkbox">
		    		<label for="selectedStudent"><input type="checkbox" value="${student.studentId }">
		    		<c:out value="${student.firstName} ${student.lastName}" /></label>
		    	</div>
		    	</c:forEach> 
		    </div>

				<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%@include file="common/footer.jspf"%>  