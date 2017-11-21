<!DOCTYPE html>
<html>
<head>
    <title>User API</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://www.techelevator.com/favicon.ico" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale: 1" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/users.js"></script>
</head>
<body>


    <div class="container">
        <table class="table table-striped table-hover" id="userTable">
            <thead>
                <tr>
                    <th>Schedule New Class</th>
                </tr>
                <tr>
                <td>Class one</td>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Instructor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
               
               <div class="container" id="f1">
   		  		<div class="col-md-3"></div>
   				 <div class="col-md-6">
        		<div id="panel1" class="panel panel-default">
            <h1>Class Name goes here</h1>
            
             <!--  <div class="dropdown">
                   <p>Instructor Name:</p><select> 
  						<!--  loop to have a dropdown for all instructor names 
  						<option value="Sunday">Instructor Name 1</option>
                    	<option value="Monday">Instructor Name 2</option>
                    	<option value="Tuesday">Instructor Name 3</option>
                    	</select>
                    </div> -->
            
            <fieldset>
                <legend><span class="number"></span>class name goes here</legend>
                <label for="name">Name:</label>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" placeholder="Type instructor name here..." aria-describedby="sizing-addon1">
                </div>
                <br />
            
            </fieldset>
			 <fieldset>
                <legend><span class="number"></span>Schedule</legend>
				<div class="row">
				  <div class="col-lg-6">
				    <div class="input-group">
				      <span class="input-group-addon">
				        <input type="checkbox" aria-label="Day of Week">
				      </span>
				      <input type="text" class="form-control" id="sunday" value="Sunday" name="day_of_week"><label class="light" for="sunday"></label><br>
				       <span class="input-group-addon">
				        <input type="checkbox" aria-label="Day of Week">
				      </span>
				      <input type="text" class="form-control" id="monday" value="Monday" name="day_of_week"><label class="light" for="monday"></label><br>
				    
				    </div>
				  </div>
            
                <legend><span class="number"></span>Schedule</legend>
                <input type="checkbox" id="sunday" value="sunday" name="day_of_week"><label class="light" for="sunday"> Sunday</label><br>
                <input type="checkbox" id="monday" value="monday" name="day_of_week"><label class="light" for="monday"> Monday</label><br>
                <input type="checkbox" id="tuesday" value="tuesdsay" name="day_of_week"><label class="light" for="tuesday"> Tuesday</label><br>
                <input type="checkbox" id="wednesday" value="wednesday" name="day_of_week"><label class="light" for="wednesday"> Wednesday</label><br>
                <input type="checkbox" id="thursday" value="thursday" name="day_of_week"><label class="light" for="thursday"> Thursday</label><br>
                <input type="checkbox" id="friday" value="friday" name="day_of_week"><label class="light" for="friday"> Friday</label><br>
                <input type="checkbox" id="saturday" value="saturday" name="day_of_week"><label class="light" for="saturday"> Saturday</label>
            </fieldset>
 			
 			<fieldset>
                <legend><span class="number"></span>Notes</legend>
                <label for="bio">Additional Class Notes:</label><br>
                <textarea id="bio" name="notes"></textarea>
            </fieldset>
         
        </div>
    </div>
    <div class="col-md-3"></div>
</div>
               
               
               <!-- Start of old Modal --> 
                <!--<h1>$"{swimClass.name}</h1>
                <h2>$"{swimClass.level</h2>
                    <form>
                    <div class="dropdown">
                    	<button class="btn" type="button" id="dropdownButton">
                    	Assign Instructor to Class
                    	</button>
                    	foreach(var instructor : InstructorList){
                    	<div class="drowpdown-menu" aria-labelledby="dropdownButton">
                    	<a class="dropdown-item" href="#">instructor</a>
                    	</div>
                    	}
                    </div>
                   <div class="dropdown">
                   <p>Day of the Week:</p><select> 
  						<option value="Sunday">Sunday</option>
                    	<option value="Monday">Monday</option>
                    	<option value="Tuesday">Tuesday</option>
                    	<option value="Wednesday">Wednesday</option>
                    	<option value="Thursday">Thursday</option>
                    	<option value="Friday">Friday</option>
                    	<option value="Saturday">Saturday</option>
                    	</select>
                    </div>
                   	<p>Time</p><select>
                   	</select>
                   	<p>Start Date</p><select>
                   	</select>
                   	<p>End Date</p><select>
                   	</select>
                   	<p>Add Students</p><select>
                   	</select>
                    	
                        <input type="hidden" name="id" id="id" />
                        <div class="form-group">
                            <label for="name">Class</label>
                            <input id="name" name="name" type="text" class="form-control" />
                        </div>
                    
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" name="email" type="text" class="form-control" />
                        </div>
                    </form>
                </div> -->
                <!-- End of old Modal --> 
               
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="save" type="button" class="btn btn-primary">Add</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>