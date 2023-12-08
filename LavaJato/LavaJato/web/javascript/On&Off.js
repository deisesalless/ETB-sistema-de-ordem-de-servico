const botao_tema = document.getElementById("botao-alterar-tema");

botao_tema.addEventListener("click", () => {
    const botao = botao_tema.querySelector("button");

    if (botao.textContent === "ativado") {
        botao.textContent = "desativado";
    } else {
        botao.textContent = "ativado";
    }
});