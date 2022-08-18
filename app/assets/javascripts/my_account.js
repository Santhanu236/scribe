    let imgInp = document.getElementById('user-img-file');
let edit_icon = document.getElementById('prof-edit');
let del_icon = document.getElementById('prof-del');
let upload_img = document.getElementById('my-acc-profile');
edit_icon.addEventListener('click', () => {
    console.log('ddd')
    imgInp.click();
});

del_icon.addEventListener('click', () => {
    console.log(imgInp.value)
    imgInp.value = null;
    console.log(imgInp.value)
});

imgInp.onchange = function () {
    let files = imgInp.files;

    if (imgInp) {
        upload_img.src = URL.createObjectURL(files[0]);
        upload_img.style.display = "block";
    }
};
let imgFile = document.getElementById("my-acc-profile");
let imgAsDataURL;
imgFile.addEventListener("load", function () {
    let imgCanvas = document.createElement("canvas"),
        imgContext = imgCanvas.getContext("2d");
    imgCanvas.width = imgFile.width;
    imgCanvas.height = imgFile.height;
    imgContext.drawImage(imgFile, 0, 0, imgFile.width, imgFile.height);
    imgAsDataURL = imgCanvas.toDataURL("image/png");
    try {
        localStorage.setItem("image-in-ls", imgAsDataURL);
    }
    catch (e) {
        console.log("Storage failed: " + e);
    } return imgAsDataURL;
}, false);

function getFromLs(key) {
    const fromLs = JSON.parse(localStorage.getItem(key));
    let returnData = [];
    if (fromLs != null) {
        returnData = fromLs;
    }
    return returnData;
}
function setToLs(key, data) {
    localStorage.setItem(key, data);
}
