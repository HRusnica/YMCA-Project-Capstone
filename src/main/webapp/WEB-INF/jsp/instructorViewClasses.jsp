<%@include file="common/instructorDashboardHeader.jspf"%>  

          <h2 class="sub-header">My Classes</h2>
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
                <c:url value="/skillsIntroduced/${classes.classId}" var="spreadSheetJSP"/>
                <tr>
                  <td><a href="${spreadSheetJSP}"><c:out value="${classes.levelName}" /></a></td>
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
    

<%@include file="common/footer.jspf"%>  