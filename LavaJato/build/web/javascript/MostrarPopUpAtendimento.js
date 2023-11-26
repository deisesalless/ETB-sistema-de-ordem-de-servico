   
    // Comando para mostrar o Pop-up utilizando JavaScript
    document.querySelector("#mostrar-pop-up").addEventListener("click", function() {
        document.querySelector("#pop-up").classList.add("ativo");
        document.querySelector("#overlay").style.display = "block";
        
        // Captura o valor do campo de observação
        var observacao = document.getElementById('observacaoInput').value;
        console.log(observacao)
        
        // Define o valor no elemento do pop-up
        document.getElementById('observacoesPopUp').innerText = observacao;
        
        // Captura o valor do campo de valorTotal
        var valorTotal = document.getElementById('valorTotal');
        
        
        if (valorTotal) {
            // Define o valor no elemento do pop-up - valorTotal
            document.getElementById('valorTotalPopUp').innerText = valorTotal.innerHTML;
        }
        
        
        // Captura os valores de observacao e valorTotal que estão no Pop-Up, estes serão enviados para o Servlet
        var observacao = document.getElementById('observacoesPopUp').innerText;
        var valorTotal = document.getElementById('valorTotalPopUp').innerText;
        
            
    });

    // Comando para fechar o Pop-up utilizando JavaScript
    document.querySelector("#pop-up .botao-fechar").addEventListener("click", function() {
        document.querySelector("#pop-up").classList.remove("ativo");
         document.querySelector("#overlay").style.display = "none";
    });