function show_password() {
    let check = document.getElementById('show-password');
    if(check.checked){
        document.getElementById('form3Example4').type = "text";
    } else {
        document.getElementById('form3Example4').type = "password";
    }
}

document.getElementById('show-password').addEventListener("change", show_password);
