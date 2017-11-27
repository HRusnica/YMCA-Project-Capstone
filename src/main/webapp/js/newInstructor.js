var root = 'http://localhost:8080/capstone/';

var newInstructorURL = '/newInstructor';


$(function(){
    $('#newInstructor-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,
        
    }); 
});

function saveNewInstructor(){
	$.ajax({
		url: root + newInstructorURL,
		method: "POST",
		data: {
			'email' : $("#emailInstructor").val(),
		}
	}).done(function(data){
		alert("The instructor has been added.");
		$("#emailInstructor").val("")
	})
};
