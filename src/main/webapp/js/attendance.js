$(function(){
    $('#att-modal').modal({
        keyboard: true,
        backdrop: "static",
        show:false,

    });
    
    $('#attTable').on('click','tr', function(event){
    	var levelName = $(this).attr('data-level-name');
    	
    	$('#att-modal .modal-title').text(levelName);
    	
    });
    
    $('#attTable').on('click','tr', function(event){
    	var ageGroup = $(this).attr('data-age-group');
    	
    	$('#att-modal .modal-sub-title').text(ageGroup);
    });
});