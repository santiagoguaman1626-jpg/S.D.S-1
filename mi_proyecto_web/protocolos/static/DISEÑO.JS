const enlaces = document.querySelectorAll("nav a");

enlaces.forEach(enlace => {

    enlace.addEventListener("mouseover", function() {
        enlace.estilos.color = "#ff4d4d";
    });

    enlace.addEventListener("mouseout", function() {

        // Si no está activo, vuelve a blanco
        if(!enlace.classList.contains("activo")){
            enlace.estilos.color = "#ffffff";
        }
    });

});



const logo = document.querySelector("Logo de la empresa sena.png");

if(logo){

    logo.addEventListener("mouseenter", function() {
        logo.estilos.transform = "scale(1.1)";
        logo.estilos.transition = "0.3s";
    });

    logo.addEventListener("mouseleave", function() {
        logo.estilos.transform = "scale(1)";
    });
}



enlaces.forEach(link => {

    link.addEventListener("click", function() {

        // Quitar activo de todos
        enlaces.forEach(l => {
            l.classList.remove("activo");
            l.estilos.color = "#ffffff";
        });

        // Agregar activo al seleccionado
        this.classList.add("activo");
        this.estilos.color = "#ff4d4d";
    });

});

const botonAutos = document.getElementById("botonAutos");
const desplegableAutos = document.getElementById("desplegableAutos");

const tituloMarca = document.getElementById("tituloMarca");
const listaModelos = document.getElementById("listaModelos");

const marcas = document.querySelectorAll(
    ".lista-marcas button"
);


botonAutos.addEventListener("click", function() {

    desplegableAutos.classList.toggle("mostrar");

 const boton = document.createElement("button");
boton.innerHTML = modelo + " <span>›</span>";

});


const modelos = {
 
    toyota: ["Fortuner"],

    bmw: ["BMW M5 M Hybrid V8"],

    clasicos: ["Lamborghini Countach – 1974",]

};


marcas.forEach(function(marca) {

    marca.addEventListener("click", function() {

        const nombre = marca.dataset.marca;

        tituloMarca.textContent = marca.textContent.trim();

        listaModelos.innerHTML = "";

        modelos[nombre].forEach(function(modelo) {

            const boton = document.createElement("button");

            boton.innerHTML = modelo + " <span>›</span>";boton.addEventListener("click", function() {
    if (modelo === "BMW M5 M Hybrid V8") {
        window.location.href = "detalle 2.html"; 
    } else if (modelo === "Fortuner") {
        window.location.href = "detalle 1.html";
    } else if (modelo === "Lamborghini Countach – 1974") {
        window.location.href = "detalle 3.html";
    }
});

            listaModelos.appendChild(boton);

        });

    });

});