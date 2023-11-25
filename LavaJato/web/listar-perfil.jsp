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
                    <h3>
                        Lista de Perfil
                        <button id="pop-up-cadastrar">
                            cadastrar
                        </button>
                    </h3>
                    <!-- Tabela para listar os Perfis cadastrados no banco de dados -->
                    <table width="600" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Perfil</td>
                            <td>Alterar</td>
                            <td>Status</td>
                            <td>Gerenciar Acesso</td>
                        </tr>
                        <%                                            
                            try {
                                PerfilDAO perfilDB = new PerfilDAO();
                                ArrayList<Perfil> lista;
                                perfilDB.conectar();
                                lista = perfilDB.listar();
                                for(Perfil perfil:lista) {
                        %>
                        <tr>
                                    <td><%=perfil.getId_perfil()%></td>
                                    <td><%=perfil.getNome()%></td>
                                    <td align="center">
                                        <a href="form-alterar-perfil.jsp?id=<%=perfil.getId_perfil()%>">
                                            <button> alterar </button>
                                        </a>
                                    </td>
                                    <td align="center">
                                        <% if (perfil.isStatus()) { %>

                                            <!-- Já que está ativado permite desativar o status -->
                                            <form action="desativar_perfil.do" method="post">
                                                <input type="hidden" name="id" value="<%=perfil.getId_perfil()%>">
                                                <input type="hidden" name="status" value="true">

                                                <!-- Mostra a imagem de status ativo -->
                                                <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                    <img src="./imagens/on.png" alt="imagem-online">
                                                </button>
                                            </form>

                                        <% } else { %>

                                            <!-- Já que está desativado permite ativar o status -->
                                            <form action="ativar_perfil.do" method="post">
                                                <input type="hidden" name="id" value="<%=perfil.getId_perfil()%>">
                                                <input type="hidden" name="status" value="true">

                                                <!-- Mostra a imagem de status desativado -->
                                                <button id="botao-alterar-tema" type="submit" value="ativar">
                                                    <img src="./imagens/off.png" alt="imagem-offline">
                                                </button>
                                            </form>
                                        <% } %>
                                    </td>
                                    
                                    <td align="center">
                                        <a href="form-gerenciar-perfil-menu.jsp?id_perfil=<%=perfil.getId_perfil()%>">
                                            <button> gerenciar </button>
                                        </a>
                                    </td>
                                </tr>
                        <%
                                }
                            perfilDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                    </table>
                </div>
                
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Perfil</h3>
                            <form name="form_cadastrar_perfil" action="cadastrar_perfil.do" method="post" onsubmit="return validaForm();">
                                <label>Perfil:</label>
                                <input type="text" name="nome" placeholder="Digite a forma de pagamento" size="30">
                                <div class="botao-salvar-formulario">
                                    <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                                </div>
                            </form> 
                        </div>
                    <script>
                        // Comando para mostrar o Pop-up utilizando JavaScript
                        document.querySelector("#pop-up-cadastrar").addEventListener("click", function() {
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