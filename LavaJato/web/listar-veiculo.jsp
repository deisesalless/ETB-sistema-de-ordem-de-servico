<%@page import="entidade.Veiculo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar veiculo</title>
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
                            <h3>Lista de Veiculo (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-veiculo.jsp">Novo</a>)</h3>
                            <table width="860" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID do Cliente</td>
                                    <td>MARCA</td>
                                    <td>COR</td>
                                    <td>PLACA</td>
                                    <td>STATUS</td>
                                    <td>ATIVAR</td>
                                    <td>DESATIVAR</td>
                                    <td>ALTERAR CADASTRO</td>
                                </tr>
                                <%                                            
                                    try {
                                        VeiculoDAO veiculoDB = new VeiculoDAO();
                                        ArrayList<Veiculo> lista;
                                        veiculoDB.conectar();
                                        lista = veiculoDB.listar();
                                        for(Veiculo veic:lista){
                                %>
                                    <tr>
                                        <td><%=veic.getCliente().getPessoa().getId()%></td>
                                        <td><%=veic.getMarca()%></td>
                                        <td><%=veic.getCor()%></td>
                                        <td><%=veic.getPlaca()%></td>
                                        <td>
                                            <% if (veic.isStatus()) { %>
                                                ativado
                                            <% } else { %>
                                                desativado
                                            <% } %>
                                        </td>
                                        <td align="center">
                                            <form action="ativar_veiculo.do" method="post">
                                              <input type="hidden" name="placa" value="<%=veic.getPlaca()%>">
                                              <input type="hidden" name="status" value="true">
                                              <input type="submit" value="Ativar">
                                            </form>
                                        </td>
                                            
                                        <td align="center">
                                            <form action="desativar_veiculo.do" method="post">
                                              <input type="hidden" name="placa" value="<%=veic.getPlaca()%>">
                                              <input type="hidden" name="status" value="false">
                                              <input type="submit" value="Desativar">
                                            </form>
                                        </td>
                                        
                                        <td align="center">
                                            <a href="form-alterar-veiculo.jsp?placa=<%=veic.getPlaca()%>"><img src="imagens/alterar.png" border="0"></a>
                                        </td>
                                    </tr>	
                                </tr>
                                <%
                                                }
                                                veiculoDB.desconectar();
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
