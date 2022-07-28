{
    if (getFromLs("dark-mode") == "true") {
        document.getElementById('darkSwitch').checked = true;
        toggle_dark();
    }
}

function toggle_dark(){
    let check = document.getElementById('darkSwitch');
    let dm_icon = document.getElementById("dm-icon");
    let blog_div = document.getElementsByClassName("blog-sub-div");
    if (check.checked) {
        setInLs('dark-mode', "true");
        dm_icon.classList.remove('fa-sun');
        dm_icon.classList.add('fa-moon');
        document.body.classList.add('dark-mode');
        for(let i=0; i < blog_div.length; i++){
            blog_div[i].className = "blog-sub-div-dark";
        }
    } else {
        setInLs('dark-mode', "false");
        dm_icon.classList.add('fa-sun');
        dm_icon.classList.remove('fa-moon');
        document.body.classList.remove('dark-mode');
        let blog_div = document.getElementsByClassName("blog-sub-div");
        for(let i=0; i < blog_div.length; i++){
            blog_div[i].classList.remove = "dark"
        }
    }
}

function setInLs(key, value) {
    localStorage.setItem(key, value);
}
function getFromLs(key) {
    return localStorage.getItem(key);
}
document.getElementById('darkSwitch').addEventListener('change', toggle_dark);


