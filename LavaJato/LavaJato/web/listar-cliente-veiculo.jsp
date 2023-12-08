
<%@page import="entidade.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.ClienteDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Página Listar Cliente</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/campo-pesquisa-cliente.css">
        <link rel="stylesheet" href="estilo_layout/pop-up-veiculo.css">
        <link rel="stylesheet" href="estilo_layout/pop-up-cliente.css">
        <link rel="stylesheet" href="estilo_layout/listar-cliente.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
<script>
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }                                

            function validaForm1(){
                formulario = document.form_cadastrar_cliente_veiculo;

                formulario.nomeCompleto.value = removerAcentos(formulario.nomeCompleto.value);
                formulario.placa.value = removerAcentos(formulario.placa.value);
                formulario.cor.value = removerAcentos(formulario.cor.value);
                formulario.marca.value = removerAcentos(formulario.marca.value);
                
                if(formulario.id_cliente.value===""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.id_cliente.focus();
                    return false;
                }
                if(formulario.nomeCompleto.value===""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.telefone.value===""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
                    return false;
                }
                if(formulario.dataCadastro.value===""){
                    alert("O campo Data deve ser preenchido!");
                    formulario.dataCadastro.focus();
                    return false;
                }
                if(formulario.placa.value===""){
                    alert("O campo Placa deve ser preenchido!");
                    formulario.placa.focus();
                    return false;
                }
                if(formulario.cor.value===""){
                    alert("O campo Cor deve ser preenchido!");
                    formulario.cor.focus();
                    return false;
                }
                if(formulario.marca.value===""){
                    alert("O campo Marca deve ser preenchido!");
                    formulario.marca.focus();
                    return false;
                }
                if(formulario.id_cliente.value===""){
                    alert("O ID do cliente deve ser preenchido!");
                    formulario.id_cliente.focus();
                    return false;
                }
                return true;
            }
            
            function validaForm2(){
                formulario = document.form_cadastrar_cliente_veiculo;

                formulario.nomeCompleto.value = removerAcentos(formulario.nomeCompleto.value);
                formulario.placa.value = removerAcentos(formulario.placa.value);
                formulario.cor.value = removerAcentos(formulario.cor.value);
                formulario.marca.value = removerAcentos(formulario.marca.value);
                
                if(formulario.id_cliente.value===""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.id_cliente.focus();
                    return false;
                }
                if(formulario.nomeCompleto.value===""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.telefone.value===""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
                    return false;
                }
                if(formulario.dataCadastro.value===""){
                    alert("O campo Data deve ser preenchido!");
                    formulario.dataCadastro.focus();
                    return false;
                }
                if(formulario.placa.value===""){
                    alert("O campo Placa deve ser preenchido!");
                    formulario.placa.focus();
                    return false;
                }
                if(formulario.cor.value===""){
                    alert("O campo Cor deve ser preenchido!");
                    formulario.cor.focus();
                    return false;
                }
                if(formulario.marca.value===""){
                    alert("O campo Marca deve ser preenchido!");
                    formulario.marca.focus();
                    return false;
                }
                if(formulario.id_cliente.value===""){
                    alert("O ID do cliente deve ser preenchido!");
                    formulario.id_cliente.focus();
                    return false;
                }
                return true;
            }
            
            function filtrarClienteVeiculo() {
                // Obter o valor digitado na caixa de texto
                var input = document.getElementById('searchInput');
                var filtro = input.value.toUpperCase();

                // Obter as tabelas e as linhas das tabelas
                var tabelas = document.querySelectorAll('.table-client');

                // Iterar pelas tabelas
                tabelas.forEach(function(tabela) {
                    var linhas = tabela.getElementsByTagName('tr');

                    // Iterar pelas linhas da tabela, iniciando a partir do índice 1 para ignorar o cabeçalho da tabela
                    for (var i = 1; i < linhas.length; i++) {
                        var colunaNome = linhas[i].getElementsByTagName('td')[0]; // Coluna do Nome Completo
                        var colunaTelefone = linhas[i].getElementsByTagName('td')[1]; // Coluna do Telefone
                        var colunaPlaca = linhas[i].getElementsByTagName('td')[2]; // Coluna da Placa do Veículo

                        // Verificar se a pesquisa corresponde ao Nome do Cliente, Telefone ou Placa do Veículo
                        if (colunaNome || colunaTelefone || colunaPlaca) {
                            var textoNome = colunaNome.textContent.toUpperCase() || colunaNome.innerText.toUpperCase();
                            var textoTelefone = colunaTelefone.textContent.toUpperCase() || colunaTelefone.innerText.toUpperCase();
                            var textoPlaca = colunaPlaca.textContent.toUpperCase() || colunaPlaca.innerText.toUpperCase();

                            if (textoNome.indexOf(filtro) > -1 || textoTelefone.indexOf(filtro) > -1 || textoPlaca.indexOf(filtro) > -1) {
                                linhas[i].style.display = '';
                            } else {
                                linhas[i].style.display = 'none';
                            }
                        }
                    }
                });
            }

        </script>
    </head>
    <body>
        <div id="overlay"></div>
        <div class="container">
             <!-- Cabeçalho da página -->
            <div class="top-section">
                <div class="logo-section">
                    <img src="imagens_site/logo.png" alt="Logo Lava Jato" class="logo">
                </div>
                <div class="title">
                    Lava Jato
                </div>
                <div>
                    <!-- Botão de sair -->
                    <a href="sair.jsp"> <button class="logout-button"> Sair </button> </a>
                </div>
            </div>

            <div class="menu-section">
                <!-- Menu da página -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção da tabela -->
            <div class="table-section">
                
                <div class="search-section">
                    <img src="imagens_site/lupa.png" alt="Lupa_Sheriff" class="lupa"> <input type="text" id="searchInput" placeholder="Pesquise pelo nome, telefone ou placa do veiculo" onkeyup="filtrarClienteVeiculo()">
                </div>
                
                <h1 class="page-title">
                    Cliente
                    <button id="pop-up-cadastrar" class="botao-padrao"> + Novo </button>
                </h1>

<%                                            
                    try {
                        ClienteDAO clienteDB = new ClienteDAO();
                        VeiculoDAO veiculoDB = new VeiculoDAO();
                        
                        clienteDB.conectar();
                        veiculoDB.conectar();
                        
                        ArrayList<Cliente> lista = clienteDB.listar();
                        for(Cliente cliente:lista) {                                             
%>

<%
                           List<Veiculo> list = veiculoDB.listar();
                                    for(Veiculo veic:list) {
                                        if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()) {
%>  
                <table class="table-client">
                    <tr>
                        <td style="text-align: center; font-weight: bold; width: 600px;">Cliente - Telefone</td>
                        <td style="text-align: center; font-weight: bold;">Alterar</td>
                        <td style="text-align: center; font-weight: bold;">Ad. Veículo</td>
                    </tr>

                    <!-- Dados da tabela -->
                    <tr>
                        <td style="text-align: center;">
                            <%=cliente.getPessoa().getNomeCompleto()%> - <%=cliente.getTelefone()%>
                        </td>
                        <td style="text-align: center;">
                            <a href="form-alterar-cliente.jsp?id=<%=cliente.getPessoa().getId()%>">
                                <button class="botao-padrao"> alterar </button>
                            </a>
                        </td>
                        <td style="text-align: center;">
                            <button class="botao-padrao" onclick="abrirPopup('<%=cliente.getPessoa().getId()%>' , '<%=cliente.getPessoa().getNomeCompleto()%>')"> + novo </button> <!-- pop-up vinculado a esse botão-->
                        </td>
                    </tr>
                                                 
                    <tr>
                        <td style="text-align: center; font-weight: bold; width: 600px;">Informações do Veículo</td>
                        <td style="text-align: center; font-weight: bold; width: 250px;">Alterar</td>    
                        <td style="text-align: center; font-weight: bold;">Ad. Atendimento</td>
                    </tr>
                    
                    <tr>
                        <td style="text-align: center;">
                            Placa: <%=veic.getPlaca()%> | Modelo: <%=veic.getModelo()%> | Marca: <%=veic.getMarca()%> | Cor: <%=veic.getCor()%>
                        </td>
                        
                        <td style="text-align: center; font-weight: bold;">
                            <a href="form-alterar-veiculo.jsp?id=<%=veic.getId()%>">
                                <button class="botao-padrao"> alterar </button>
                            </a>
                        </td>
                        <td style="text-align: center; font-weight: bold;">
                            <a href="form-cadastrar-atendimento.jsp?id_veiculo=<%=veic.getId()%>">
                                <button class="botao-padrao"> + novo </button>
                            </a>
                        </td>
                    </tr> 
                </table>
<%
                                        }
                                    }
%>

<%
                            }
                                veiculoDB.desconectar();
                                clienteDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
%>
            
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Cliente</h3>
                            <form name="form_cadastrar_cliente_veiculo" action="cadastrar_cliente_veiculo.do" method="post" onsubmit="return validaForm1();">

                                <label>Nome Completo:</label>
                                <input type="text" name="nomeCompleto" placeholder="Digite o nome completo" size="30">

                                <label>Telefone:</label>
                                <input type="text" name="telefone" placeholder="Digite o telefone" size="30">
                                
                                <label>Marca do veículo:</label>
                                <input type="text" name="marca" placeholder="Digite a marca do veículo" size="30">
                                
                                <label>Modelo do veículo:</label>
                                <input type="text" name="modelo" placeholder="Digite o modelo do veículo" size="30">

                                <label>Cor do veículo:</label>
                                <input type="text" name="cor" placeholder="Digite a cor do veículo" size="30">

                                <label>Placa do veículo:</label>
                                <input type="text" name="placa" placeholder="Digite a placa do veículo" size="30">
                                
                                <div class="botao-salvar-formulario">
                                    <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                                </div>
                            </form> 
                        </div>
                    <script>
                        // Comando para mostrar o Pop-up utilizando JavaScript
                        document.querySelector("#pop-up-cadastrar").addEventListener("click", function() {
                            document.querySelector("#pop-up").classList.add("ativo");
                            document.querySelector("#overlay").style.display = "block";
                        });

                        // Comando para fechar o Pop-up utilizando JavaScript
                        document.querySelector("#pop-up .botao-fechar").addEventListener("click", function() {
                            document.querySelector("#pop-up").classList.remove("ativo");
                             document.querySelector("#overlay").style.display = "none";
                        });
                    </script>
                </div>

                <div id="pop-up-veiculo"> 
                    <div class="botao-fechar-veiculo">&times;</div>
                    <div class="formulario">
                        <h3>Cadastrar Novo Veículo</h3>
                        <form name="form_cadastrar_veiculo" action="cadastrar_veiculo.do" method="post" onsubmit="return validaForm2();">
                            
                            <span id="identificador"></span>
                            <input type="hidden" name="id_cliente" id="id_client">
                            <span id="nome"></span>
                            <input type="hidden" name="nomeCompleto" id="nome_client" size="30">
                            <br>
                            
                            <label>Marca do veículo:</label>
                            <input type="text" name="marca" placeholder="Digite a marca do veículo" size="30">

                            <label>Modelo do veículo:</label>
                            <input type="text" name="modelo" placeholder="Digite o modelo do veículo" size="30">

                            <label>Cor do veículo:</label>
                            <input type="text" name="cor" placeholder="Digite a cor do veículo" size="30">

                            <label>Placa do veículo:</label>
                            <input type="text" name="placa" placeholder="Digite a placa do veículo" size="30"><br>
                            
                            <div class="botao-salvar-formulario">
                                <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                            </div>
                        </form>
                    </div>
                </div>
                <script>
                    function abrirPopup(idCliente, nomeCliente) {
                        // Captura o ID que veio do onclick
                        var clienteId = idCliente;
                        var clienteNome = nomeCliente;

                        // Define o valor no elemento do pop-up-veiculo
                        document.getElementById('identificador').innerHTML = clienteId;
                        document.getElementById('nome').innerHTML = clienteNome;

                        var teste1 = document.getElementById('identificador').innerHTML ;
                        var teste2 = document.getElementById('nome').innerHTML;

                        // Define o valor no elemento input
                        document.getElementById('id_client').value = teste1;
                        document.getElementById('nome_client').value = teste2;

                        document.querySelector("#pop-up-veiculo").classList.add("ativo");
                        document.querySelector("#overlay").style.display = "block";

                    }

                    document.querySelector("#pop-up-veiculo .botao-fechar-veiculo").addEventListener("click", function() {
                        document.querySelector("#pop-up-veiculo").classList.remove("ativo");
                        document.querySelector("#overlay").style.display = "none";
                    });
                </script>
            </div>
                
            <!-- Informações adicionais -->
            <div class="info-section">
                <div class="info-item">
                    <label>Endereço:</label>
                    <span>Quadra 42 Lote 51A Parque Araguari I, Cidade Ocidental - GO, 72.885-234</span>
                </div>
                <div class="info-item">
                    <label>Telefone:</label>
                    <span>(61) 3605-3474</span>
                    <img src="imagens_site/logo-whatsapp.png" alt="Logo Instagram">
                </div>
                <div class="info-item">
                    <label>Instagram:</label>
                    <span> @lavajato</span>
                    <img src="imagens_site/logo-instagram.png" alt="Logo Instagram">
                </div>
            </div>
        </div>
    </body>
</html>
