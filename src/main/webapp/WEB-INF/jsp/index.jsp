<!DOCTYPE html> 
<html>
    <head>
        <title>YMCA Swim</title>
  
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
        
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
		
    </head>
    
    <body>
    
        <div class="section blue" id="section1">
           
			<h2>YMCA Swim Class Login Page</h2>
			<c:url var="loginUrl" value="/login"/>
			<form:form method="POST" action="${loginUrl}" modelAttribute="login">
				
				<div>
				<label for="email">Email</label>
				<form:input path="email"/>
				<form:errors path="email" cssClass="error"></form:errors>
				</div>
				
				<div>
				<label for="password">Password</label>
				<form:password path="password"/>
				<form:errors path="password" cssClass="error"></form:errors>
				</div>
				
				<div>
					<label></label>
					<input type="submit" value="Submit"/>	
				</div>
			
			</form:form>

            <ul class="nav">
                <li><a href="#section2">Register</a></li>
            </ul>
        </div>
        <div class="regSection white" id="section2">
            <h2>Register</h2>
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
				<form:password path="password"/>
				<form:errors path="password" cssClass="error"></form:errors>
			</div>
			<div>
				<input type="submit" value="Submit"/>	
			</div>
		</form:form>
            <ul class="nav">
                <li><a href="#section1">Home</a></li>
            </ul>
        </div>
        

        <!-- The JavaScript -->
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>	
        <script type="text/javascript">
            $(function() {
                $('ul.nav a').bind('click',function(event){
                    var $anchor = $(this);
                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 2000);
                    event.preventDefault();
                });
            });
        </script>
    </body>
</html>