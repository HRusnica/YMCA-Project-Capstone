var root = 'http://localhost:8080/capstone/';

var addAccomplishedSkillURL = '/addAccomplishedSkill';


$(function(){
	$('#addAccomplishedSkill-modal').modal({
		keyboard: true,
        backdrop: "static",
        show:false,
	});
	
	$('#addAccomplishedSkillTable').on('click', 'tr', function(event){
		var skillName= $(this).attr('data-skill-name');
		
		$('#class-modal .modal-sub-title').text(skillName);
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
		alert("The skill has been updated to accomplished.");
		$("#skillId").val("");
		$("#studentId").val("");
	})
};

