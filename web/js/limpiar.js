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
    check = document.getElementById("proponente");
    check2 = document.getElementById("colaborador");
    if (check.checked) {
        element.style.display = 'block';
        document.getElementById("direccion").required = true;
    } else {
        element.style.display = 'none';
        document.getElementById("direccion").required = false;
    }
    if (check2.checked) {
        element.style.display = 'none';
    }
}