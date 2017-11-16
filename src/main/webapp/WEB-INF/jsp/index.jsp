<!DOCTYPE html>
<html>
    <head>
        <title>Website Horizontal Scrolling with jQuery</title>
        <link rel="stylesheet" href="stylesheet.css" type="text/css" media="screen"/>
   
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   
    </head>
  
    <body>
    
        <div class="section black" id="section1">
            <h2>YMCA Swim Class Home Page</h2>
            <p>
                Welcome ...
            </p>
            <ul class="nav">
                <li>Home</li>
                <li><a href="#section2">Login</a></li>
                <li><a href="#section3">Register</a></li>
            </ul>
        </div>
        <div class="section white" id="section2">
            <h2>Login</h2>
				
				
            <ul class="nav">
                <li><a href="#section1">Home</a></li>
                <li>Login</li>
                <li><a href="#section3">Register</a></li>
            </ul>
        </div>
        <div class="section black" id="section3">
            <h2>New Registration Page</h2>
			
			
			
            <ul class="nav">
                <li><a href="#section1">Home</a></li>
                <li><a href="#section2">Login</a></li>
                <li>Register</li>
            </ul>
        </div>

        <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>		
        <script type="text/javascript" src="jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(function() {
                $('ul.nav a').bind('click',function(event){
                    var $anchor = $(this);
                    /*
                    if you want to use one of the easing effects:
                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 1500,'easeInOutExpo');
                     */
                    $('html, body').stop().animate({
                        scrollLeft: $($anchor.attr('href')).offset().left
                    }, 1000);
                    event.preventDefault();
                });
            });
        </script>
    </body>
</html>