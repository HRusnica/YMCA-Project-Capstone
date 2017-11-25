var root = 'http://localhost:8080/capstone/';

var idk = '/newInstructor';


$(function(){
    $('#newInstructor-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,
        
    }); 
});

function saveNewInstructor(){
	$.ajax({
		url: root + idk,
		method: "POST",
		data: {
			'email' : $("#emailInstructor").val(),
		}
	}).done(function(data){
		alert("The instructor has been added.");
		$("#emailInstructor").val("")
	})
};
