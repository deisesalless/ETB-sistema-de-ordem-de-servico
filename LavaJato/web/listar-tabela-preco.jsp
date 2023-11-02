
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página - listar tabela de preços</title>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <img src="imagens/banner.PNG" alt="banner"/>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp"%> 
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h3>Tabela de Serviços (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-tabela-preco.jsp">Novo</a>)</h3>
                            <table width="750" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>SERVIÇO</td>
                                    <td>VEICULO PEQUENO</td>
                                    <td>VEICULO MEDIO</td>
                                    <td>VEICULO GRANDE</td>
                                    <td>ALTERAR</td>
                                    <td>STATUS</td>
                                </tr>
                                <%                                            
                                    try {
                                        TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
                                        ArrayList<TabelaPreco> lista;
                                        DecimalFormat formato = new DecimalFormat("0.00");
                                        tabelaPrecoDB.conectar();
                                        lista = tabelaPrecoDB.listar();
                                        for(TabelaPreco tabelaPrecoo:lista){
                                %>
                                    <tr>
                                        <td><%=tabelaPrecoo.getId()%></td>
                                        <td><%=tabelaPrecoo.getNome()%></td>
                                            <%
                                                Double precoVeiculoPequeno = tabelaPrecoo.getPrecoVeiculoPequeno();
                                                String precoPequenoVeiculo = formato.format(precoVeiculoPequeno);
                                            %>
                                        <td><%=precoPequenoVeiculo%></td>
                                            <%
                                                Double precoVeiculoMedio = tabelaPrecoo.getPrecoVeiculoMedio();
                                                String precoMedioVeiculo = formato.format(precoVeiculoMedio);
                                            %>
                                        <td><%=precoMedioVeiculo%></td>
                                            <%
                                                Double precoVeiculoGrande = tabelaPrecoo.getPrecoVeiculoGrande();
                                                String precoMedioGrande = formato.format(precoVeiculoGrande);
                                            %>
                                        <td><%=precoMedioGrande%></td>
                                        <td align="center"><a href="form-alterar-tabela-preco.jsp?id=<%=tabelaPrecoo.getId()%>"><img src="imagens/alterar.png" border="0"></a></td>
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
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
