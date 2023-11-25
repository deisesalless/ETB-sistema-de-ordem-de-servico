
    function adicionarServico(id, nome, preco) {
        // Cria uma nova linha na tabela de carrinho com as informações do serviço selecionado
        var tabelaCarrinho = document.getElementById("tabelaCarrinho");
        var novaLinha = tabelaCarrinho.insertRow();

        // Insere as células na nova linha
        var celulaDesvincular = novaLinha.insertCell(0);
        var celulaId = novaLinha.insertCell(1);
        var celulaNome = novaLinha.insertCell(2);
        var celulaPreco = novaLinha.insertCell(3);

        // Botão para desvincular o serviço (remover a linha quando o botão for clicado)
        var botaoRemover = document.createElement("button");
        botaoRemover.textContent = "remover";
        botaoRemover.onclick = function() {
            var row = this.parentNode.parentNode;
            row.parentNode.removeChild(row);
            // Função para atualizar o valor total
             calcularValorTotal();
        };

        celulaDesvincular.appendChild(botaoRemover);

        // Insere os dados do serviço nas células
        celulaId.innerHTML = id;
        celulaNome.innerHTML = nome;

        var precoFormatado = parseFloat(preco).toFixed(2).replace(".", ",");
        celulaPreco.innerHTML = precoFormatado;

        // Calcula e atualiza o valor total
        calcularValorTotal();

        function calcularValorTotal() {
            var tabelaCarrinho = document.getElementById("tabelaCarrinho");
            var linhas = tabelaCarrinho.getElementsByTagName("tr");
            var total = 0;

            for (var i = 1; i < linhas.length; i++) {
                var preco = parseFloat(linhas[i].cells[3].innerText.replace("R$ ", "").replace(",", "."));
                total += preco;
            }

            // Exibe o valor total calculado na tabela
            var valorTotal = document.getElementById("valorTotal");
            valorTotal.innerHTML = total.toFixed(2).replace(".", ",");
        }
    }
