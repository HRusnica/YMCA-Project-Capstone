var root = 'http://localhost:8080/capstone/';

var newClassURL = '/newScheduledClass';

$(function(){
    $('#class-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,
        
    });
});

function saveNewClass(){
	$.ajax({
		url: root + newClassURL,
		method: "POST",
		data: {
			'instructorId' : $("#classInstructorId").val(),
			'dayOfWeek' : $("#classDayOfWeek").val(),
			'hour' : $("#classHour").val(),
			'startDate' : $("#classStartDate").val(),
			'endDate' : $("#classEndDate").val(),
			'levelId' : $("#classLevelId").val(),
		}
	}).done(function(data){
		alert("The class has been added.");
		$("#classInstructorId").val("");
		$("#classDayOfWeek").val("");
		$("#classHour").val("");
		$("#classStartDate").val("");
		$("#classEndDate").val("");
	})
};