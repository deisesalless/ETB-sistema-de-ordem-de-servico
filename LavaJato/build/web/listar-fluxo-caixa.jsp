<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>P�gina Listar Fluxo de Caixa</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/relatorios.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
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

            <div class="menu-section">
                <!-- Menu da p�gina -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Se��o da tabela -->
            <div class="table-section">
                <h1 class="page-title"> Gerenciamento do Fluxo de Caixa </h1>
                
                <table>
                    <tr>
                        <td align="center">
                            <button class="botao-relatorio">
                                <a href="listar-entrada-caixa.jsp"> Visualizar Entrada de Valores </a>
                            </button> 
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <button class="botao-relatorio">
                                <a href="listar-saida-caixa.jsp"> Visualizar e Cadastrar Saida de Valores </a>
                            </button>
                        </td>
                    </tr>
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
