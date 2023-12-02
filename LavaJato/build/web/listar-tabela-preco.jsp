
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
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
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/tabela-preco.css">
        <script src="javascript/On&Off.js"></script>
    </head>
    <body>
        <div id="overlay"></div>
        <div id="pagina">
            
            <div id="banner">
                <img src="imagens/banner.PNG" alt="banner">
            </div>
            
            <div id="menu">
                <%@include file="menu.jsp"%> 
            </div>
            
            <div id="principal">
                
                <div class="conteudo" align="center">
                    <h3>
                        Tabela de Preços
                        <button id="mostrar-pop-up">+ Novo</button>
                    </h3>
                    <!-- Tabela para listar os Perfis cadastrados no banco de dados -->
                    <table width="900" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Descrição</td>
                            <td>Veículo Pequeno</td>
                            <td>Veículo Médio</td>
                            <td>Veículo Grande</td>
                            <td>Alterar</td>
                            <td>Status</td>
                        </tr>
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
                            <td><%=tabelaPrecoo.getId()%></td>
                            <td><%=tabelaPrecoo.getNome()%></td>
                                <%
                                    Double precoVeiculoPequeno = tabelaPrecoo.getPrecoVeiculoPequeno();
                                    String precoPequenoVeiculo = formato.format(precoVeiculoPequeno);
                                %>
                            <td align="right"><%=precoPequenoVeiculo%></td>
                                <%
                                    Double precoVeiculoMedio = tabelaPrecoo.getPrecoVeiculoMedio();
                                    String precoMedioVeiculo = formato.format(precoVeiculoMedio);
                                %>
                            <td align="right"><%=precoMedioVeiculo%></td>
                                <%
                                    Double precoVeiculoGrande = tabelaPrecoo.getPrecoVeiculoGrande();
                                    String precoMedioGrande = formato.format(precoVeiculoGrande);
                                %>
                            <td align="right"><%=precoMedioGrande%></td>
                            <td align="center">
                                <a href="form-alterar-tabela-preco.jsp?id=<%=tabelaPrecoo.getId()%>">
                                    <button> alterar </button>
                                </a>
                            </td>
                            <td>
                                <% if (tabelaPrecoo.isStatus()) { %>
                                    <!-- Já que está ativado permite desativar o status -->
                                    <form action="desativar_tabela_preco.do" method="post">
                                        <input type="hidden" name="id" value="<%=tabelaPrecoo.getId()%>">
                                        <input type="hidden" name="status" value="true">

                                        <!-- Mostra a imagem de status ativo -->
                                        <button id="botao-alterar-tema" type="submit" value="Desativar">
                                            <img src="./imagens/on.png" alt="imagem-online">
                                        </button>
                                    </form>
                                <% } else { %>

                                    <!-- Já que está desativado permite ativar o status -->
                                    <form action="ativar_tabela_preco.do" method="post">
                                        <input type="hidden" name="id" value="<%=tabelaPrecoo.getId()%>">
                                        <input type="hidden" name="status" value="true">

                                        <!-- Mostra a imagem de status desativado -->
                                        <button id="botao-alterar-tema" type="submit" value="ativar">
                                            <img src="./imagens/off.png" alt="imagem-offline">
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
                </div>
                
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
        </div>
    </body>
</html>