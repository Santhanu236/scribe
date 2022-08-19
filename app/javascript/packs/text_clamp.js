console.log
let rm = document.getElementById('read-more');
let text = document.getElementById('blog-text');
rm.addEventListener('click', function() {
    text.classList.toggle("text-cutting")
});
