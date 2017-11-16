<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:set var="pageTitle" value="register"/>
		
<h2>New Registration Page</h2>
<c:url var="registerUrl" value="/register"/>
<form:form method="POST" action="${registerUrl}" modelAttribute="registration">
	
			<div>
				<label for="firstName">First Name</label>
				<form:input path="firstName"/>
				<form:errors path="firstName" cssClass="error"></form:errors>
			</div>
			<div>
				<label for="lastName">Last Name</label>
				<form:input path="lastName"/>
				<form:errors path="lastName" cssClass="error"></form:errors>
			</div>
			<div>
				<label for="email">Email Address</label>
				<form:input path="email"/>
				<form:errors path="email" cssClass="error"></form:errors>
			</div>
			<div>
				<label for="password">Password</label>
				<form:input path="password"/>
				<form:errors path="password" cssClass="error"></form:errors>
			</div>
	<div>
		<input type="submit" value="Submit"/>	
	</div>
</form:form>
