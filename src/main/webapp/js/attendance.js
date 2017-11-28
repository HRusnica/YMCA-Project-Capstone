var root = 'http://localhost:8080/capstone/';

var getStudentListURL='/studentList';

var classIdData;

$(function(){
    $('#att-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,

    });
    
    $('#attTable').on('click','tr', function(event){
    	var levelName = $(this).attr('data-level-name');
    	
    	$('#att-modal .modal-title').text(levelName);
    	
   
    	var ageGroup = $(this).attr('data-age-group');
    	
    	$('#att-modal .modal-sub-title').text(ageGroup);
   
    	var classId = $(this).attr('data-class-id');
    	
    	getAllStudentsAttendance(classId);

    });
 
});
function getAllStudentsAttendance(classId){
	$.ajax({
		url: root + getStudentListURL,
		method: "GET",
		data: {
			classId : this.classId,
		}
		
	}).done(function(data){
		$('#att-modal .modal-body').val();
		classIdData = data;
		
	})
};