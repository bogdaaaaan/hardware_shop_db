//const cons = require("consolidate");

$(document).ready(function() {

    $('.delete-record').on('click', function() {
        var id = $(this).data('id');
        var url =  window.location.pathname + '/delete/' + id;
        if (confirm('Delete value?')) {
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function(result) {
                    console.log('Deleting record...');
                    window.location.href = (window.location.pathname);
                },
                error: function(err) {
                    console.log(err);
                }
            });
        }
    });

    $("#first").on("keyup", function() {
        filter(this.id, 0);
    });

    $("#second").on("keyup", function() {
        filter(this.id, 1);
    });

    $("#third").on("keyup", function() {
        filter(this.id, 2);
    });
 
    $("#forth").on("keyup", function() {
        filter(this.id, 3);
    });

    $("#fifth").on("keyup", function() {
        filter(this.id, 4);
    });

    $("#sixth").on("keyup", function() {
        filter(this.id, 5);
    });

    $("#seventh").on("keyup", function() {
        filter(this.id, 6);
    });

    $("#eight").on("keyup", function() {
        filter(this.id, 7);
    });

    $("#ninth").on("keyup", function() {
        filter(this.id, 8);
    });

    $("#tenth").on("keyup", function() {
        filter(this.id, 9);
    });
 
 

    function filter(id, value) {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById(id);
        filter = input.value.toUpperCase();
        table = document.getElementById("order_table");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[value];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
            } else {
            tr[i].style.display = "none";
            }
        }
}
    }

    $('.edit-order').on('click', function() {
        $('#edit-form-client_id').val($(this).data('client_id'));
        $('#edit-form-employee_id').val($(this).data('employee_id'));
        $('#edit-form-hardware_warehouse').val($(this).data('hardware_warehouse'));
        $('#edit-form-order_date').val($(this).data('order_date'));
        $('#edit-form-id').val($(this).data('id'));
    });
    $('.edit-order_details').on('click', function() {
        $('#edit-form-order_id').val($(this).data('order_id'));
        $('#edit-form-hardware_id').val($(this).data('hardware_id'));
        $('#edit-form-quantity').val($(this).data('quantity'));
        $('#edit-form-discount').val($(this).data('discount'));
        $('#edit-form-id').val($(this).data('order_id'));
    });
    $('.edit-client').on('click', function() {
        $('#edit-form-id').val($(this).data('id'));
        $('#edit-form-first_name').val($(this).data('first_name'));
        $('#edit-form-second_name').val($(this).data('second_name'));
        $('#edit-form-phone_number').val($(this).data('phone_number'));
        $('#edit-form-email_address').val($(this).data('email_address'));
    });
    $('.edit-hardware').on('click', function() {
        $('#edit-form-id').val($(this).data('id'));
        $('#edit-form-category_id').val($(this).data('category_id'));
        $('#edit-form-manufacturer_id').val($(this).data('manufacturer_id'));
        $('#edit-form-name').val($(this).data('name'));
        $('#edit-form-color').val($(this).data('color'));
        $('#edit-form-material_type').val($(this).data('material_type'));
        $('#edit-form-connection_type').val($(this).data('connection_type'));
        $('#edit-form-size').val($(this).data('size'));
        $('#edit-form-weight').val($(this).data('weight'));
        $('#edit-form-description').val($(this).data('description'));

    })

})