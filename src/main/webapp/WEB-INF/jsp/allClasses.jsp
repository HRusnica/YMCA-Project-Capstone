<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Tab title -->
<c:set var="pageTitle" value="YMCA - Login & Manager"/>

<%@include file="common/header.jspf"%>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
 		<div >  <h1>All Classes</h1> </div>
			<c:forEach items= "${allClasses}" var="class">
		<div  >

		<p ><strong><c:out value="${class.levelName}"/></strong></p>
		<p ><strong><c:out value="${class.ageGroup}"/></strong></p>
		  <br>
		 
		</div>
		</c:forEach>
		
		
		<%@include file="common/footer.jspf"%>