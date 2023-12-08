    // Comando para mostrar o Pop-up utilizando JavaScript
    document.querySelector("#mostrar-pop-up").addEventListener("click", function() {
        document.querySelector("#pop-up").classList.add("ativo");
        document.querySelector("#overlay").style.display = "block";
    });

    // Comando para fechar o Pop-up utilizando JavaScript
    document.querySelector("#pop-up .botao-fechar").addEventListener("click", function() {
        document.querySelector("#pop-up").classList.remove("ativo");
         document.querySelector("#overlay").style.display = "none";
    });
