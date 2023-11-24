<%@page import="java.util.List"%>
<%@page import="entidade.Menu"%>
<%@page import="persistencia.MenuDAO"%>
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
                formulario = document.form_cadastrar_menu;
                if(formulario.menu.value===""){
                    alert("O campo MENU deve ser preenchido!");
                    formulario.menu.focus();
                    return false;
                }
                if(formulario.link.value===""){
                    alert("O campo LINK deve ser preenchido!");
                    formulario.link.focus();
                    return false;
                }
                return true;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/listar-menu.css">
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
                        Lista de Menu
                        <button id="pop-up-cadastrar">
                            cadastrar
                        </button>
                    </h3>
                    <table width="800" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Menu</td>
                            <td>Link</td>
                            <td>Alterar</td>
                            <td>Excluir</td>
                        </tr>
                        <%                                            
                            try {
                                MenuDAO mDB = new MenuDAO();
                                mDB.conectar();
                                List<Menu> lista = mDB.listar();
                                for(Menu m:lista) {
                        %>
                        <tr>
                            <td align="center"><%=m.getId_menu()%></td>
                            <td><%=m.getMenu() %></td>
                            <td><%=m.getLink() %></td>
                            <td align="center">
                                <a href="form-alterar-menu.jsp?id_menu=<%=m.getId_menu()%>">
                                    <button> alterar </button>
                                </a>
                            </td>
                            <td align="center">
                                <a href="excluir-menu.do?id_menu=<%=m.getId_menu()%>">
                                    <button> excluir </button>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                                mDB.desconectar();
                            } catch (Exception erro) {
                                out.print("Não possui nenhum Menu cadastrado. Mensagem: " + erro);
                            }
                        %>
                    </table>
                </div>
                
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Menu</h3>
                            <form name="form_cadastrar_menu" action="cadastrar_menu.do" method="post" onsubmit="return validaForm();">
                                <label>Menu:</label>
                                <input type="text" name="menu" placeholder="Digite o nome do Menu" size="30">
                                <label>Link:</label>
                                <input type="text" name="link" placeholder="Digite o link do Menu" size="30">
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