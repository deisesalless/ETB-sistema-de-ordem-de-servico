<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Página Tabela de Preços</title>
        <link rel="stylesheet" href="estilo_layout/perfil.css">
        <link rel="stylesheet" href="estilo_layout/pop-up-tabela-preco.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
    
            function validaForm(){
                formulario = document.form_cadastrar_tabela_preco;
                
                formulario.nome.value = removerAcentos(formulario.nome.value);
                
                
                if(formulario.nome.value===""){
                    alert("O campo Nome do Serviço deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.precoVeiculoPequeno.value===""){
                    alert("O campo Preço do Veículo Pequeno deve ser preenchido!!");
                    formulario.precoVeiculoPequeno.focus();
                    return false;
                }
                if(formulario.precoVeiculoMedio.value===""){
                    alert("O campo Preço do Veículo Medio deve ser preenchido!!");
                    formulario.precoVeiculoMedio.focus();
                    return false;
                }
                if(formulario.precoVeiculoGrande.value===""){
                    alert("O campo Preço do Veículo Grande deve ser preenchido!!");
                    formulario.precoVeiculoGrande.focus();
                    return false;
                }
                return true;
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
                
                <h1 class="page-title">
                    Tabela de Preços
                    <button id="mostrar-pop-up" class="botao-padrao"> + Novo </button>
                </h1>
                
                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Descrição</td>
                        <td style="text-align: center; font-weight: bold;">Veículo Pequeno</td>
                        <td style="text-align: center; font-weight: bold;">Veículo Médio</td>
                        <td style="text-align: center; font-weight: bold;">Veículo Grande</td>
                        <td style="text-align: center; font-weight: bold;">Alterar</td>
                        <td style="text-align: center; font-weight: bold;">Status</td>
                    </tr>
                    
                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
                        ArrayList<TabelaPreco> lista;
                        DecimalFormat formato = new DecimalFormat("0.00");
                        tabelaPrecoDB.conectar();
                        lista = tabelaPrecoDB.listar();
                        for(TabelaPreco tabelaPrecoo:lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;"><%=tabelaPrecoo.getNome()%></td>

                        <%
                            Double precoVeiculoPequeno = tabelaPrecoo.getPrecoVeiculoPequeno();
                            String precoPequenoVeiculo = formato.format(precoVeiculoPequeno);
                        %>
                        <td style="text-align: right;"><%=precoPequenoVeiculo%></td>

                        <%
                            Double precoVeiculoMedio = tabelaPrecoo.getPrecoVeiculoMedio();
                            String precoMedioVeiculo = formato.format(precoVeiculoMedio);
                        %>
                        <td style="text-align: right;"><%=precoMedioVeiculo%></td>

                        <%
                            Double precoVeiculoGrande = tabelaPrecoo.getPrecoVeiculoGrande();
                            String precoMedioGrande = formato.format(precoVeiculoGrande);
                        %>  
                        <td style="text-align: right;"><%=precoMedioGrande%></td>
                        
                        <td style="text-align: center;">
                            <a href="form-alterar-tabela-preco.jsp?id=<%=tabelaPrecoo.getId()%>"> <button class="botao-padrao"> alterar </button> </a>
                        </td>
                        
                        <td>
                            <% if (tabelaPrecoo.isStatus()) { %>
                                <!-- Já que o status está ativado permite desativar -->
                                <form action="desativar_tabela_preco.do" method="post">
                                    <input type="hidden" name="id" value="<%=tabelaPrecoo.getId()%>">
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        ativado
                                    </button>
                                </form>
                            <% } else { %>

                                <!-- Já que o status está desativado permite ativar -->
                                <form action="ativar_tabela_preco.do" method="post">
                                    <input type="hidden" name="id" value="<%=tabelaPrecoo.getId()%>">
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        desativado
                                    </button>
                                </form>
                            <% } %>
                            
                        </td>
                    </tr>
                <%
                        }
                        tabelaPrecoDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar novo Serviço e Preço</h3>
                            <form name="form_cadastrar_tabela_preco" action="cadastrar_tabela_preco.do" method="post" onsubmit="return validaForm();">
                                <label>Descrição:</label>
                                <input type="text" name="nome" placeholder="Digite o nome do serviço" size="30">
                                
                                <label>Preço do Veículo Pequeno:</label>
                                <input type="text" name="precoVeiculoPequeno" placeholder="Digite o preço" size="30">
                                
                                <label>Preço do Veículo Medio:</label>
                                <input type="text" name="precoVeiculoMedio" placeholder="Digite o preço" size="30">
                                
                                <label>Preço do Veículo Grande:</label>
                                <input type="text" name="precoVeiculoGrande" placeholder="Digite o preço" size="30">
                                
                                <div class="botao-salvar-formulario">
                                    <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                                </div>
                            </form> 
                        </div>
                    <script>
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
                    </script>
                </div>
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
