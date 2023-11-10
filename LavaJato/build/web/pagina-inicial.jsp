
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
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/tabela-preco.css">
        <script src="javascript/On&Off.js"></script>
    </head>
    <body>
        <div id="pagina">
            
            <div id="banner">
                <img src="imagens/banner.PNG" alt="banner">
            </div>
            
            <div id="menu">
                <%@include file="menu.jsp"%> 
            </div>
            
            <div id="principal">
                
                <div class="conteudo" align="center">
                    <h3> Tabela de Preços </h3>
                    <!-- Tabela para listar os Perfis cadastrados no banco de dados -->
                    <table width="600" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Descrição</td>
                            <td>Veículo Pequeno</td>
                            <td>Veículo Médio</td>
                            <td>Veículo Grande</td>
                        </tr>
                        <%                                            
                            try {
                                TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
                                ArrayList<TabelaPreco> lista;
                                DecimalFormat formato = new DecimalFormat("0.00");
                                tabelaPrecoDB.conectar();
                                lista = tabelaPrecoDB.listar();
                                for(TabelaPreco tabelaPrecoo:lista) {
                                    if (tabelaPrecoo.isStatus()) {
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
                        </tr>
                        <%
                                    }
                                }
                                tabelaPrecoDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </table>
                </div>

            </div>       
        </div>
    </body>
</html>