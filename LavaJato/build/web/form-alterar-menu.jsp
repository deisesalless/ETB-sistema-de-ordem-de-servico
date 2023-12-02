<%@page import="entidade.Menu"%>
<%@page import="persistencia.MenuDAO"%>
<%@page import="java.util.List"%>
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
            
            function validaForm(){
                formulario = document.form_cadastrar_menu;
                
                formulario.menu.value = removerAcentos(formulario.menu.value);
                formulario.link.value = removerAcentos(formulario.link.value);
                
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
                    <h3> Alterar Perfil </h3>
                    
                    <form name="form_alterar_menu" action="alterar_menu.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                            <%
                                int id_menu = Integer.parseInt(request.getParameter("id_menu"));
                                
                                try {
                                    MenuDAO menuDB = new MenuDAO();
                                    menuDB.conectar();
                                    Menu menu = menuDB.pesquisarPorId(id_menu);
                            %>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    ID
                                </td>
                                <td>
                                    <%=menu.getId_menu()%><input type="hidden" name="id_menu" value="<%=menu.getId_menu()%>">
                                </td>
                            </tr>

                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Menu
                                </td>
                                <td>
                                    <input type="text" name="menu" value="<%=menu.getMenu()%>" size="100%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Link
                                </td>
                                <td>
                                    <input type="text" name="link" value="<%=menu.getLink()%>" size="100%">
                                </td>
                            </tr>
                            <%
                                menuDB.desconectar();
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                            %>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Salvar"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>       
        </div>
    </body>
</html>