function show_password() {
    let check = document.getElementById('show-password');
    if(check.checked){
        document.getElementById('new-pw').type = "text";
        document.getElementById('confirm-pw').type = "text";
    } else {
        document.getElementById('new-pw').type = "password";
        document.getElementById('confirm-pw').type = "password";
    }
}
function check_pass() {
    const new_pw = document.getElementById('new-pw').value;
    const confirm_pw = document.getElementById('confirm-pw').value;
    if(new_pw == confirm_pw){
        return true;
    } else{
        return false;
    }
}
function submit_signup(){

    if(check_pass()){
        document.getElementById('signup-form').submit();
    } else {
        document.getElementById('warn-div').innerHTML =
        `<p class="text-danger">Passwords do not match</P>`;
    }
}

// event area:
document.getElementById('show-password').addEventListener("change", show_password);
document.getElementById('submit-btn').addEventListener('click',submit_signup);
