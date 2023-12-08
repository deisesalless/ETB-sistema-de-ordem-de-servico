
    document.querySelector(".botao-salvar").addEventListener("click", function() {
        var data = jsonData();

        fetch('/CadastrarAtendimento', {
            method: 'POST',
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
