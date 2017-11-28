var root = 'http://localhost:8080/capstone/';

var addStudentToClassURL = '/addStudentToClass';

$(function(){
	$('#addStudentToClass-modal').modal({
		keyboard: true,
        backdrop: "static",
        show:false,
	});
});

function addStudentToClass(){
	$.ajax({
		url: root + addStudentToClassURL,
		method: "POST",
		data: {
			'studentId' : $("#studentId").val(),
			'classId' : $("#classId").val()
		}
	
	}).done(function(data){
		alert("The student has been added.");
		$("#studentId").val("");
		$("#classId").val("");
	})
};