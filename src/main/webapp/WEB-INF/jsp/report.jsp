<%@include file="common/managerDashboardHeader.jspf"%>   

  <h2 class="sub-header">Student Reports</h2>
          <div class="table-responsive">
            <table class="table table-striped">
             <thead>
                <tr>
                  <th>Student Name</th>
                  
                 
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${allStudents}" var="students">
                <!--  SHOW ALL STUDENTS -->
                <tr>
                  
                  <td><c:out value="${students.firstName} ${students.lastName }"/></td>
                  <c:url value="/generateReport/${student.studentId}" var="studentReport"/>
                  <td><a href="${studentReport}" >Report</a></td>
                  
                  </tr>
                  </c:forEach>
              </tbody>
            </table>
          </div>

<%@include file="common/footer.jspf"%>         

