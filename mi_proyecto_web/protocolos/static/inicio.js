const formulario = document.getElementById("loginForm");
const mensaje = document.getElementById("mensaje");

formulario.addEventListener("submit", function(event) {

    event.preventDefault();

    const usuario = document.getElementById("usuario").value.trim();
    const contrasena = document.getElementById("contrasena").value.trim();

    if (usuario === "ADMIN" && contrasena === "1234") {

        mensaje.textContent = "¡Inicio de sesión correcto!";
        mensaje.style.color = "green";

    } else if (usuario === "RAMIREZ" && contrasena === "7718") {

        mensaje.textContent = "¡Inicio de sesión correcto!";
        mensaje.style.color = "green";

        } else if (usuario === "GUAMAN" && contrasena === "6767") {

        mensaje.textContent = "¡Inicio de sesión correcto!";
        mensaje.style.color = "green";
} else if (usuario === "MORA" && contrasena === "0904") {

        mensaje.textContent = "¡Inicio de sesión correcto!";
        mensaje.style.color = "green";


    } else {

        mensaje.textContent = "Usuario o contraseña incorrectos.";
        mensaje.style.color = "red";

    }

});