document.addEventListener('input', function () {
    var password_field = document.getElementById('password')
    var confirm_password_field = document.getElementById('confirm_password')

    if (confirm_password_field.value) {
        change_field_color(password_field, confirm_password_field)
    } else {
        set_default_color(password_field, confirm_password_field)
    }
})

function change_field_color(password_field, confirm_password_field) {
    if (password_field.value == confirm_password_field.value) {
        password_field.style.borderColor = 'green'
        confirm_password_field.style.borderColor = 'green'
    }
    else {
        password_field.style.borderColor = 'red'
        confirm_password_field.style.borderColor = 'red'
    }
}

function set_default_color(password_field, confirm_password_field) {
    password_field.style.borderColor = "#ced4da"
    confirm_password_field.style.borderColor = '#ced4da'
}