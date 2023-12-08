const botao_tema = document.getElementById("botao-alterar-tema");

botao_tema.addEventListener("click", () => {
    const botao = botao_tema.querySelector("button");

    if (botao.textContent === "Em Aberto") {
        botao.textContent = "Pago";
    } else {
        botao.textContent = "Em Aberto";
    }
});