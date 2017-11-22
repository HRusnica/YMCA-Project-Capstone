$(function(){
    $('#class-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,

    });
    
    $('#allClassesTable').on('click','tr', function(event){
    	var levelName = $(this).attr('data-level-name');
    	
    	$('#class-modal .modal-title').text(levelName);
    	
    });
    
    $('#allClassesTable').on('click','tr', function(event){
    	var ageGroup = $(this).attr('data-age-group');
    	
    	$('#class-modal .modal-sub-title').text(ageGroup);
    });
});