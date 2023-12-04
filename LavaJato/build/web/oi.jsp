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
                    <h3> Gerenciamento do Fluxo de Caixa </h3>
                    
                    <table>
                        <tr>
                            <td align="center">
                                <button>
                                    <a href="listar-entrada-caixa.jsp"> Visualizar Entrada de Valores </a>
                                </button> 
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button>
                                    <a href="listar-saida-caixa.jsp"> Visualizar & Cadastrar Saida de Valores </a>
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>       
        </div>
    </body>
</html>