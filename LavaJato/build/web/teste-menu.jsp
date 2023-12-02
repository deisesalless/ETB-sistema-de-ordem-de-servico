<%@page import="java.util.List"%>
<%@page import="entidade.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Menu</title>
    </head>
    <body>
        <table width="100%">
            <tr>
                <td>
                    <% // Mostra o usuario que está logado
                        Usuario usuario = new Usuario();
                        try{
                            usuario = (Usuario) session.getAttribute("usuario");
                            out.print("Olá " + usuario.getLogin() + " (<a href='sair.jsp'>Sair</a>)");
                            if (usuario == null){
                                response.sendRedirect("index.jsp");
                            }

                    %>
                </td>
            </tr>
        </table>
                
        <table width="100%">
            <tr>
                <%
                
                            PerfilDAO perfilDB = new PerfilDAO();
                            perfilDB.conectar();
                            ArrayList<Menu> listaMenu = perfilDB.menusVinculados(usuario.getPerfil().getId_perfil());
                            for(Menu menu: listaMenu) {
                            
                %>

                <td>
                    <a href="<%=menu.getLink()%>"> <%=menu.getMenu()%> </a> |
                </td>

                <%
                    
                            }

                            perfilDB.desconectar();
                
                        }catch(Exception e){
                            //out.print(e);
                            response.sendRedirect("index.jsp");
                        }
                
                %>
            </tr>
        </table>
    </body>
</html>
