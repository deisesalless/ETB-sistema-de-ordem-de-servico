<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
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
            
            // Remover acentuações do campo observacao
             formulario.nome.value = removerAcentos(formulario.nome.value);

            function validaForm(){
                formulario = document.form_cadastrar_perfil;
                if(formulario.nome.value===""){
                    alert("O campo PERFIL deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                return true;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/perfil.css">
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
                    <h3> Emissão de Relatórios </h3>
                    
                    <table>
                        <tr>
                            <td align="center">
                                <button>
                                    <a href="gerar-relatorio-produtividade-atendimento.do"> Produtividade dos Atendimentos </a>
                                </button> 
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button>
                                    <a href="gerar-relatorio-entrada-valores.do"> Entrada de Valores </a>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button>
                                    <a href="gerar-relatorio-saida-valores.do"> Saída De Valores </a>
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>

            </div>       
        </div>
    </body>
</html>