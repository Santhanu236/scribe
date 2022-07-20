{
    if (getFromLs("dark-mode") == "true") {
        document.getElementById('darkSwitch').checked = true;
        toggle_dark();
    }
}

function toggle_dark(){
    check = document.getElementById('darkSwitch');
    if (check.checked) {
        setInLs('dark-mode', "true");
        document.body.classList.add('dark-mode');
    } else {
        setInLs('dark-mode', "false");
        document.body.classList.remove('dark-mode');
    }
}
function setInLs(key, value) {
    localStorage.setItem(key, value);
}
function getFromLs(key) {
    return localStorage.getItem(key);
}
document.getElementById('darkSwitch').addEventListener('change', toggle_dark);


