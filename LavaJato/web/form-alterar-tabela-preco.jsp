<%@page import="entidade.TabelaPreco"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="entidade.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="entidade.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.PerfilDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Alterar Valor do Servi�o</title>
        <link rel="stylesheet" href="estilo_layout/alterar-usuario.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
    
            function validaForm(){
                formulario = document.form_cadastrar_tabela_preco;
                
                formulario.nome.value = removerAcentos(formulario.nome.value);
                
                
                if(formulario.nome.value===""){
                    alert("O campo Nome do Servi�o deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.precoVeiculoPequeno.value===""){
                    alert("O campo Pre�o do Ve�culo Pequeno deve ser preenchido!!");
                    formulario.precoVeiculoPequeno.focus();
                    return false;
                }
                if(formulario.precoVeiculoMedio.value===""){
                    alert("O campo Pre�o do Ve�culo Medio deve ser preenchido!!");
                    formulario.precoVeiculoMedio.focus();
                    return false;
                }
                if(formulario.precoVeiculoGrande.value===""){
                    alert("O campo Pre�o do Ve�culo Grande deve ser preenchido!!");
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
            
             <!-- Cabe�alho da p�gina -->
            <div class="top-section">
                <div class="logo-section">
                    <img src="imagens_site/logo.png" alt="Logo Lava Jato" class="logo">
                </div>
                <div class="title">
                    Lava Jato
                </div>
                <div>
                    <!-- Bot�o de sair -->
                    <a href="sair.jsp"> <button class="logout-button"> Sair </button> </a>
                </div>
            </div>
             
             <!-- Menu da p�gina -->
            <div class="menu-section">
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Se��o da tabela -->
            <div class="table-section">
                
                <h1 class="page-title"> Alterar Servi�o e Valor </h1>
                
                <form name="form_alterar_tabela_preco" action="alterar_tabela_preco.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        try {
                            TabelaPrecoDAO tabelaPrecooDB = new TabelaPrecoDAO();
                            DecimalFormat formato = new DecimalFormat("0.00");
                            List<TabelaPreco> lista;
                            tabelaPrecooDB.conectar();
                            lista = tabelaPrecooDB.pesquisarPorId(id);
                            tabelaPrecooDB.desconectar();
                            for (TabelaPreco servico:lista) {
                    %>
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Nome do Servi�o
                            </td>
                            <td>
                                <input type="text" name="nome" value="<%=servico.getNome()%>" size="70%">
                                <input type="hidden" name="id" value="<%=servico.getId()%>">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Pre�o do Ve�culo Pequeno
                            </td>
                            
                            <td>
                                <%
                                    Double precoPequenoVeiculo = servico.getPrecoVeiculoPequeno();
                                    String precoVeiculoPequeno = formato.format(precoPequenoVeiculo);
                                %>
                                <input type="text" name="precoVeiculoPequeno" value="<%=precoVeiculoPequeno%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Pre�o do Ve�culo M�dio
                            </td>
                            
                            <td>
                                <%
                                    Double precoMedioVeiculo = servico.getPrecoVeiculoMedio();
                                    String precoVeiculoMedio = formato.format(precoMedioVeiculo);
                                %>
                                <input type="text" name="precoVeiculoMedio" value="<%=precoVeiculoMedio%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Pre�o do Ve�culo Grande
                            </td>
                            
                            <td>
                                <%
                                    Double precoGrandeVeiculo = servico.getPrecoVeiculoGrande();
                                    String precoVeiculoGrande = formato.format(precoGrandeVeiculo);
                                %>
                                <input type="text" name="precoVeiculoGrande" value="<%=precoVeiculoGrande%>" size="70%">
                            </td>
                        </tr>

                    <%
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                    </table>
                    
                    <button type="submit" value="Salvar" class="botao-padrao botao-salvar"> Salvar </button>
                </form>
            </div>

            <!-- Informa��es adicionais -->
            <div class="info-section">
                <div class="info-item">
                    <label>Endere�o:</label>
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
