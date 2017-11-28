<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Instructor View All Classes</title>

	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Table CSS -->	
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 10px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-yw4l{vertical-align:top}
</style>


    <!-- Bootstrap core CSS -->
    <c:url value="/css/bootstrap.min.css" var="cssBootstrap"/>
    <link href="${cssBootstrap}" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <c:url value="/css/dashboard.css" var="cssDashboard"/>
    <link href="${cssDashboard}" rel="stylesheet">
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">YMCA Swim</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
           <c:url value="/instructorDashboard" var="instructorDashboard"/>
            <li><a href="${instructorDashboard}">Overview </a></li>
            <c:url value="/instructorViewClasses" var="instructorViewClassesLink"/>
            <li class="active"><a href="${instructorViewClassesLink}">View My Classes<span class="sr-only">(current)</span></a></li>
           
          </ul>
          <ul class="nav nav-sidebar">
            <li><strong>LINKS</strong></li>
            <c:url value="http://www.ymca.net/" var="ymcaLink"/>
            <li><a href="${ymcaLink}">YMCA</a></li>
            <c:url value="http://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/water-safety/swim-safety" var="swimSafety"/>
            <li><a href="${swimSafety}">Swim Safety Tips</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <!--  <li><a href="">Another nav item</a></li>-->
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Instructor Dashboard</h1>



<h4>Student Skills Page</h4>
<h2><c:out value="${swimClass.levelId}"/></h2>
<h2><c:out value="${swimClass.levelName}"/></h2>
<h3>Class Level</h3>
	
	<table class="tg">
	   
	   <thead>
			<tr>
			<td colspan="11">I = Skill Introduced M = Skill Mastered</td>
			</tr>
	  </thead>
	  
 <!-- foreach for Student Names -->
		  <tr>
		    <th class="tg-031e"></th> <!-- Spacer Column -->
		    <th>Student Name</th>
		  </tr>

<!-- foreach for Skill Names -->	 
	  <tr>
	    <td class="tg-yw4l">Skill Name 1</td>
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	   
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	         
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	
	  </tr>
	  <tr>
	    <td class="tg-yw4l">Skill Name 2</td>
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	   
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	         
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	  </tr>
	  <tr>
	    <td class="tg-yw4l">Skill Name 3</td>
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	   
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	         
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	  </tr>
	  <tr>
	    <td class="tg-yw4l">Skill Name 4</td>
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	   
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	    
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	    
	    <td class="tg-yw4l">
	    <input type="checkbox" name="introduced" value="introduced"> I
	    <input type="checkbox" name="mastered" value="mastered"> M
	    </td>
	         
	    <td class="tg-yw4l"></td> <!-- Spacer Column -->
	  </tr>
	  <tfoot>
			<tr>
			<td colspan="11"><button type="button" class="btn btn-default" id="button2">Save</button></td>
			</tr>
	  </tfoot>
	</table>


 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
   
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>