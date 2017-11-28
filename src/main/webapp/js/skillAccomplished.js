var root = 'http://localhost:8080/capstone/';

var addAccomplishedSkillURL = '/addAccomplishedSkill';

$(function(){
	$('#addAccomplishedSkill-modal').modal({
		keyboard: true,
        backdrop: "static",
        show:false,
	});
});

function addStudentToClass(){
	$.ajax({
		url: root + addAccomplishedSkillURL,
		method: "POST",
		data: {
			'skillId' : $("#addAccomplishedSkillId").val(),
			'studentId' : $("#addAccomplishedStudentId").val()
		}
	
	}).done(function(data){
		alert("The skill has been added.");
		$("#skillId").val("");
		$("#studentId").val("");
	})
};