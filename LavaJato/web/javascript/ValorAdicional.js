    function adicionarValorAdicional() {
        // Obtém o valor digitado no campo de texto
        var valorAdicionalInput = document.getElementById("valorAdicionalInput");
        var valorAdicional = parseFloat(valorAdicionalInput.value.replace(",", ".")); // Converte para float

        // Verifica se o valor digitado é válido
        if (!isNaN(valorAdicional) && valorAdicional > 0) {
            // Cria uma nova linha na tabela de carrinho para exibir o valor adicional
            var tabelaCarrinho = document.getElementById("tabelaCarrinho");
            var novaLinha = tabelaCarrinho.insertRow();

            // Insere as células na nova linha
            var celulaDesvincular = novaLinha.insertCell(0);
            var celulaId = novaLinha.insertCell(1);
            var celulaNome = novaLinha.insertCell(2);
            var celulaPreco = novaLinha.insertCell(3);

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

            // Insere os dados do valor adicional nas células
            celulaId.innerHTML = "ADICIONAL";
            celulaNome.innerHTML = "VALOR ADICIONAL";
            celulaPreco.innerHTML = valorAdicional.toFixed(2).replace(".", ",");

            // Calcula e atualiza o valor total
            calcularValorTotal();
        } else {
            alert("Por favor, insira um valor válido o campo VALOR ADICIONAL.");
        }

        // Limpa o campo de entrada após adicionar o valor ao carrinho
        valorAdicionalInput.value = "";
    }

    // Função para calcular o valor total
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