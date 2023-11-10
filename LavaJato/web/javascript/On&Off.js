const botao_tema = document.getElementById("botao-alterar-tema");

const body = document.querySelector("body");

const imagem_tema = document.querySelector(".imagem-botao");


botao_tema.addEventListener("click",() => {

    const modo_ativado = body.classList.contains("modo-online");

    body.classList.toggle("modo-online");

    if (modo_ativado === true) {
        imagem_tema.setAttribute('src', "./imagens/on.jpg");
    } else {
        imagem_tema.setAttribute("src", "./imagens/off.jpg");
    }
    
});