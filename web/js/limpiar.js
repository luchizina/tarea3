/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



// cuando se muestre la página
window.addEventListener('pageshow', function(event) {
    // borra el formulario (asumiendo que sólo hay uno; si hay más, especifica su Id)
    document.querySelector("form").reset();
});

function showContent() {
    element = document.getElementById("content");
    element2 = document.getElementById("content2");
    element3 = document.getElementById("content3");
    check = document.getElementById("con");
    check2 = document.getElementById("con2");
    check3 = document.getElementById("con3");
    if (check.checked) {
        element.style.display = 'block';
    } else {
        element.style.display = 'none';
    }
    if (check2.checked) {
        element2.style.display = 'block';
    }else {
        element2.style.display = 'none';
    }
    if (check3.checked) {
        element3.style.display = 'block';
    }else {
        element3.style.display = 'none';
    }
}