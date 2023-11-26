   
   // Quando o botão salvar for clicado executa a função de enviarServlet
    document.querySelector("#pop-up .botao-salvar").addEventListener("click", function() {
        
        // Chama o arquivo jsonDATA e atribui o resultado a uma variavel
        var data = jsonData();

        fetch('/CadastrarAtendimento', {
            method: 'processRequest',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => {
            // Lida com a resposta do servidor, se necessário
        })
        .catch(error => {
            // Lida com erros, se necessário
        });
    
    });
