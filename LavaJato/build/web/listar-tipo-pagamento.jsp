
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
            function validaForm(){
                formulario = document.form_cadastrar_tipo_pagamento;
                if(formulario.nome.value===""){
                    alert("O campo NOME deve ser preenchido!");
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
                    <h3>
                        Lista das Formas de Pagamento
                        <button id="mostrar-pop-up">+ Novo</button>
                    </h3>
                    <!-- Tabela para listar as Formas de Pagamento cadastrados no banco de dados -->
                    <table width="600" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Forma de Pagamento</td>
                            <td>Alterar</td>
                            <td>Status</td>
                        </tr>
                        <%                                            
                            try {
                                FormaDePagamentoDAO tipo_pagDB = new FormaDePagamentoDAO();
                                ArrayList<FormaDePagamento> lista;
                                tipo_pagDB.conectar();
                                lista = tipo_pagDB.listar();
                                for(FormaDePagamento tipo_pag:lista) {
                        %>
                        <tr>
                                    <td><%=tipo_pag.getServicoPreco().getId()%></td>
                                    <td><%=tipo_pag.getServicoPreco().getNome()%></td>
                                    <td align="center">
                                        <a href="form-alterar-tipo-pagamento.jsp?id=<%=tipo_pag.getServicoPreco().getId()%>">
                                            <button> alterar </button>
                                        </a>
                                    </td>
                                    <td align="center">
                                        <% if (tipo_pag.getServicoPreco().isStatus()) { %>

                                            <!-- Já que está ativado permite desativar o status -->
                                            <form action="desativar_pagamento.do" method="post">
                                                <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                                <input type="hidden" name="status" value="true">

                                                <!-- Mostra a imagem de status ativo -->
                                                <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                    <img src="./imagens/on.png" alt="imagem-online">
                                                </button>
                                            </form>

                                        <% } else { %>

                                            <!-- Já que está desativado permite ativar o status -->
                                            <form action="ativar_pagamento.do" method="post">
                                                <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
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
                            tipo_pagDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </table>
                </div>
                
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Forma de Pagamento</h3>
                            <form name="form_cadastrar_tipo_pagamento" action="cadastrar_tipo_pagamento.do" method="post" onsubmit="return validaForm();">
                                <label>Nome:</label>
                                <input type="text" name="nome" placeholder="Digite a forma de pagamento" size="30">
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