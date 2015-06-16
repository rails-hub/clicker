function select_item(obj_e) {
    if (obj_e.value === "ATTENDANCE") {
        $('#quiz').hide();
        $('#quiz_or_poll').hide();
    }
    else if (obj_e.value === "QUIZ") {
        $('#quiz').show();
        $('#quiz_or_poll').show();
    }
    else if (obj_e.value === "POLL") {
        $('#quiz_or_poll').show();
    }
}

function mark_present(obje, interactive_item_id, attendance_id, user_id, course_id) {
    var checked = $(obje).is(':checked');
    var url = "/admin/courses/" + course_id + "/interactive_items/" + interactive_item_id + "/attendances/" + attendance_id;
    $.ajax({
        type: "POST",
        data: { _method: 'PUT', user_id: user_id, checked: checked, attendance_id: attendance_id },
        url: url,
        dataType: 'json',
        success: function (msg) {
        }
    });
}



