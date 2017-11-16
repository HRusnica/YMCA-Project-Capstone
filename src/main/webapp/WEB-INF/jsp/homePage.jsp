<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="Home Page"/>


<h2>YMCA Swim Class Home Page</h2>

<p>Welcome to the YMCA Home Page....</p>

<c:url var="login" value="/login"/>
<p><a href="${login}">Login</a></p>

<c:url var="register" value="/register"/>
<p><a href="${register}">New User Registration</a></p>


