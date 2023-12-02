<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>P�gina Inicial</title>
        <link rel="stylesheet" href="estilo_layout/pagina-inicial.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
    </head>
    <body>
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

            <div class="menu-section">
                <!-- Menu da p�gina -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Se��o da tabela -->
            <div class="table-section">
                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Descri��o</td>
                        <td style="text-align: center; font-weight: bold;">Ve�culo Pequeno</td>
                        <td style="text-align: center; font-weight: bold;">Ve�culo M�dio</td>
                        <td style="text-align: center; font-weight: bold;">Ve�culo Grande</td>
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
                            if (tabelaPrecoo.isStatus()) {
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
