<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de listar Perfil</title>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <img src="imagens/banner.PNG" alt="banner"/>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp"%> 
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h3>Lista de Perfil (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-perfil.jsp">Novo</a>)</h3>
                            <table width="550" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>Perfil</td>
                                    <td>Status</td>
                                    <td>Ativar</td>
                                    <td>Desativar</td>
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
                                            <td><%=perfil.getId()%></td>
                                            <td><%=perfil.getNome()%></td>
                                            <td>
                                                <% if (perfil.isStatus()) { %>
                                                    ativado
                                                <% } else { %>
                                                    desativado
                                                <% } %>
                                            </td>
                                            <td align="center">
                                                <form action="ativar_perfil.do" method="post">
                                                  <input type="hidden" name="id" value="<%=perfil.getId()%>">
                                                  <input type="hidden" name="status" value="true">
                                                  <input type="submit" value="Ativar">
                                                </form>
                                            </td>
                                            
                                            <td align="center">
                                                <form action="desativar_perfil.do" method="post">
                                                  <input type="hidden" name="id" value="<%=perfil.getId()%>">
                                                  <input type="hidden" name="status" value="false">
                                                  <input type="submit" value="Desativar">
                                                </form>
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
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>