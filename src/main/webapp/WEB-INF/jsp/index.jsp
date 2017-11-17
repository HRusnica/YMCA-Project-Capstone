<!DOCTYPE html> 
<html>
    <head>
        <title>Website Horizontal Scrolling with jQuery</title>
  
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
        
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
		
    </head>
    
    <body>
    
        <div class="section blue" id="section1">
           
			<h2>YMCA Swim Class Login Page</h2>
			
            <ul class="nav">
                <li><a href="#section2">Register</a></li>
            </ul>
        </div>
        <div class="regSection white" id="section2">
            <h2>Register</h2>
            <p>
              Register info goes here
            </p>
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
                    }, 4000);
                    event.preventDefault();
                });
            });
        </script>
    </body>
</html>