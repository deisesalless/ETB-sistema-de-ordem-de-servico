<%@page import="entidade.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar cliente</title>
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
                            <h3>Lista de Clientes (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-cliente.jsp">Novo</a>)</h3>
                            <table width="860" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>SOBRENOME</td>
                                    <td>TELEFONE</td>
                                    <td>STATUS</td>
                                    <td>ATIVAR</td>
                                    <td>DESATIVAR</td>
                                    <td>ALTERAR CADASTRO</td>
                                </tr>
                                <%                                            
                                    try {
                                        ClienteDAO clientDB = new ClienteDAO();
                                        ArrayList<Cliente> lista;
                                        clientDB.conectar();
                                        lista = clientDB.listar();
                                        for(Cliente client:lista){
                                %>
                                    <tr>
                                        <td><%=client.getPessoa().getId()%></td>
                                        <td><%=client.getPessoa().getNome()%></td>
                                        <td><%=client.getPessoa().getSobrenome()%></td>
                                        <td><%=client.getTelefone()%></td>
                                        <td>
                                            <% if (client.getPessoa().isStatus()) { %>
                                                ativado
                                            <% } else { %>
                                                desativado
                                            <% } %>
                                        </td>
                                        <td align="center">
                                            <form action="ativar_cliente.do" method="post">
                                              <input type="hidden" name="id" value="<%=client.getPessoa().getId()%>">
                                              <input type="hidden" name="status" value="true">
                                              <input type="submit" value="Ativar">
                                            </form>
                                        </td>
                                            
                                        <td align="center">
                                            <form action="desativar_cliente.do" method="post">
                                              <input type="hidden" name="id" value="<%=client.getPessoa().getId()%>">
                                              <input type="hidden" name="status" value="false">
                                              <input type="submit" value="Desativar">
                                            </form>
                                        </td>
                                        
                                        <td align="center">
                                            <a href="form-alterar-cliente.jsp?id=<%=client.getPessoa().getId()%>"><img src="imagens/alterar.png" border="0"></a>
                                        </td>
                                    </tr>	
                                </tr>
                                <%
                                                }
                                                clientDB.desconectar();
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
