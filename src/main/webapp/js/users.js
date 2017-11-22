$(function () { 

    $('#allClassesTable').on('click', 'tr', function(event){
        var levelId = $(this).attr('data-level-id');
        var levelName = $(this).attr('data-level-name');
        var ageGroup = $(this).attr('data-age-group');
        $(levelId)
        $('#myModal').modal();

    });


    $('#save').on('click', function(event){
        event.preventDefault();

        var id = $('#id').val();
        var name = $('#name').val();
        var username = $('#username').val();
        var email = $('#email').val();

        $.ajax({
            url: root + "/users/" + id + "?name=" + name + "&username=" + username + "&email=" + email,
            method: "PUT",
            data: {
                'name': name,
                'username': username,
                'email': email,
            },
        }).then(function(data){
            refreshTable();
        })
        $('#myModal').modal('hide');
    })
});