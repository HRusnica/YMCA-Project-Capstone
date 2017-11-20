<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Tab title -->
<c:set var="pageTitle" value="YMCA - Login & Manager" />

<%@include file="common/header.jspf"%>

<div class="loginSection blue" id="login">
	<div class="screen">
		<c:url var="whiteTransLogo" value="/img/ymcaBlue.jpeg" />
		<img class="logo row" src="${whiteTransLogo}" />
		<h2>Swim Class Login</h2>
		<c:url var="loginUrl" value="/login" />
		<form:form method="POST" action="${loginUrl}" modelAttribute="login">

			<c:if test="${registration.email != null}">
				<h3>
					The following email has been registered:
					<c:out value="${registration.email}" />
				</h3>
			</c:if>

			<div class="loginForm">
				<label for="email">Email</label><br>
				<form:input path="email" />
				<form:errors path="email" cssClass="error"></form:errors>
			</div>

			<div class="loginForm">
				<label for="password">Password</label><br>
				<form:password path="password" />
				<form:errors path="password" cssClass="error"></form:errors>
			</div>

			<div class="loginForm">
				<br><input type="submit" value="Submit" class="indexButtons"/>
			</div>

		</form:form>

		<ul class="nav">
			<li style="list-style-type: none;"><a href="#register">Go Register</a></li>
		</ul>
	</div>
</div>

<div class="regSection white" id="register">
	<div class="container-fluid">
		<h2>Register</h2>
		<c:url var="registerUrl" value="/register" />
		<form:form method="POST" action="${registerUrl}"
			modelAttribute="registration">

			<div>
				<label for="firstName">First Name</label><br>
				<form:input path="firstName" />
				<form:errors path="firstName" cssClass="error" />
			</div>
			<div>
				<label for="lastName">Last Name</label><br>
				<form:input path="lastName" />
				<form:errors path="lastName" cssClass="error" />
			</div>
			<div>
				<label for="email">Email Address</label><br>
				<form:input path="email" />
				<form:errors path="email" cssClass="error" />
			</div>
			<div>
				<label for="password">Password</label><br>
				<form:password path="password" />
				<form:errors path="password" cssClass="error" />
			</div>
			<div>
				<br><input type="submit" value="Submit" />
			</div>
		</form:form>
		<div>
			<ul class="nav">
				<li><a href="#login">Return to Login</a></li>
			</ul>
		</div>
	</div>
</div>


<!-- The JavaScript -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('ul.nav a').bind('click', function(event) {
			var $anchor = $(this);
			$('html, body').stop().animate({
				scrollLeft : $($anchor.attr('href')).offset().left
			}, 2000);
			event.preventDefault();
		});
	});
</script>


<%@include file="common/footer.jspf"%>
