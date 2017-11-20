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
                <h1>$"{swimClass.name}</h1>
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
                    	<button class="btn" 
                    </div>
                    <p>Day of the Week:</p><select> 
  						<option value="Sunday">Sunday</option>
                    	<option value="Monday">Monday</option>
                    	<option value="Tuesday">Tuesday</option>
                    	<option value="Wednesday">Wednesday</option>
                    	<option value="Thursday">Thursday</option>
                    	<option value="Friday">Friday</option>
                    	<option value="Saturday">Saturday</option>
                    	</select>
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
                            <label for="name">Clas</label>
                            <input id="name" name="name" type="text" class="form-control" />
                        </div>
                    
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" name="email" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="save" type="button" class="btn btn-primary">Add</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>