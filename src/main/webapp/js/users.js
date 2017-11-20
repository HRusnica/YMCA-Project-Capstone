var root = 'http://localhost:8080/UserRestApi';

var refreshTable = function() {
    $('#userTable tbody').empty();

    $.ajax({
        url: root +"/users",
        method: "GET",
    }).then(function(data) {
        for(var i=0; i<data.length; i++){
            var tableRow = "<tr>" + 
                "<td>" + data[i].id + "</td>" +
                "<td>" + data[i].name + "</td>" +
                "<td>" + data[i].username + "</td>" +
                "<td>" + data[i].email + "</td>" +
                '<td><a href="#" class="btn btn-danger delete-button" data-user-id="' + data[i].id +'">DELETE</a></td>' +
                "</tr>";

            $("#userTable tbody").append(tableRow);    
        }
    });
};

$(function () { 
    
    refreshTable();

    $('#userTable').on('click', 'tr', function(event){
        var id = $(this).children(0).eq(0).text();
        var name = $(this).children(0).eq(1).text();
        var username = $(this).children(0).eq(2).text();
        var email = $(this).children(0).eq(3).text();

        $('#id').val(id);
        $('#name').val(name);
        $('#username').val(username);
        $('#email').val(email);

        $('#myModal').modal();

    });

    $('#userTable').on('click', '.delete-button', function(event){
        event.preventDefault();
        event.stopPropagation();

        var id = $(this).attr('data-user-id');
        $.ajax({
            url: root+ '/users/' + id,
            method: 'DELETE'
        }).then(function(data){
            refreshTable();
        });
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