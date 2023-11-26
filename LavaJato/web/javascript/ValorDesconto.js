    function adicionarValorDesconto() {
        // Obtém o valor digitado no campo de texto
        var valorDescontoInput = document.getElementById("valorDescontoInput");
        var valorDesconto = parseFloat(valorDescontoInput.value.replace(",", ".")); // Converte para float

        // Verifica se o valor digitado é válido
        if (!isNaN(valorDesconto) && valorDesconto < 0) {
            // Cria uma nova linha na tabela de carrinho para exibir o valor de desconto
            var tabelaCarrinho = document.getElementById("tabelaCarrinho");
            var novaLinha = tabelaCarrinho.insertRow();

            // Insere as células na nova linha
            var celulaDesvincular = novaLinha.insertCell(0);
            var celulaId = novaLinha.insertCell(1);
            var celulaNome = novaLinha.insertCell(2);
            var celulaPreco = novaLinha.insertCell(3);
            celulaPreco.classList.add("valor");

            // Botão para desvincular o valor adicional (remover a linha quando o botão for clicado)
            var botaoRemover = document.createElement("button");
            botaoRemover.textContent = "remover";
            botaoRemover.onclick = function() {
                var row = this.parentNode.parentNode;
                row.parentNode.removeChild(row);
                // Chame a função para atualizar o valor total aqui, se necessário
                calcularValorTotal();
            };

            celulaDesvincular.appendChild(botaoRemover);

            // Insere os dados do valor de desconto nas células
            celulaId.innerHTML = "DESCONTO";
            celulaNome.innerHTML = "VALOR DE DESCONTO";
            celulaPreco.innerHTML = valorDesconto.toFixed(2).replace(".", ",");

            // Calcula e atualiza o valor total
            calcularValorTotal();
        } else {
            alert("Por favor, insira um valor válido o campo VALOR DE DESCONTO.");
        }

        // Limpa o campo de entrada após adicionar o valor ao carrinho
        valorDescontoInput.value = "";
    }

    