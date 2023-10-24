<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Funcionario"%>
<%@page import="persistencia.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar usuario</title>
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
                            <h3>Lista de Funcionarios (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-funcionario.jsp">Novo</a>)</h3>
                            <table width="860" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>SOBRENOME</td>
                                    <td>APELIDO</td>
                                    <td>TELEFONE</td>
                                    <td>DATA DO CADASTRO</td>
                                    <td>PERFIL</td>
                                    <td>STATUS</td>
                                    <td>ATIVAR</td>
                                    <td>DESATIVAR</td>
                                    <td>ALTERAR CADASTRO</td>
                                </tr>
                                <%                                            
                                    try {
                                        FuncionarioDAO funcDB = new FuncionarioDAO();
                                        ArrayList<Funcionario> lista;
                                        funcDB.conectar();
                                        lista = funcDB.listar();
                                        for(Funcionario func:lista){
                                %>
                                    <tr>
                                        <td><%=func.getPessoa().getId()%></td>
                                        <td><%=func.getPessoa().getNome()%></td>
                                        <td><%=func.getPessoa().getSobrenome()%></td>
                                        <td><%=func.getApelido()%></td>
                                        <td><%=func.getTelefone()%></td>
                                        <td><%=DataUtility.DataUtility.formatarDataComPadrao(func.getPessoa().getDataCadastro())%></td>
                                        <td>
                                            <%
                                                // Atributo local, pega o Cnpj que veio da página Listar Empresa
                                                int id = func.getPerfil().getId();
                                                // Instancia um objeto e faz conectar ao banco de dados
                                                try {
                                                    PerfilDAO perfilBD = new PerfilDAO();
                                                    perfilBD.conectar();
                                                    Perfil perf = perfilBD.pesquisarPerfilPorId(id);
                                                    perfilBD.desconectar();
                                             %>        
                                                    <%=perf.getNome()%>
                                            <%
                                                } catch (Exception erro) {
                                                     out.print(erro);
                                                }
                                            %>
                                        </td>
                                        <td>
                                            <% if (func.getPerfil().isStatus()) { %>
                                                ativado
                                            <% } else { %>
                                                desativado
                                            <% } %>
                                        </td>
                                        <td align="center">
                                            <form action="ativar_funcionario.do" method="post">
                                              <input type="hidden" name="id" value="<%=func.getPessoa().getId()%>">
                                              <input type="hidden" name="status" value="true">
                                              <input type="submit" value="Ativar">
                                            </form>
                                        </td>
                                            
                                        <td align="center">
                                            <form action="desativar_funcionario.do" method="post">
                                              <input type="hidden" name="id" value="<%=func.getPessoa().getId()%>">
                                              <input type="hidden" name="status" value="false">
                                              <input type="submit" value="Desativar">
                                            </form>
                                        </td>
                                        
                                        <td align="center">
                                            <a href="form-alterar-funcionario.jsp?id=<%=func.getPessoa().getId()%>"><img src="imagens/alterar.png" border="0"></a>
                                        </td>
                                    </tr>	
                                </tr>
                                <%
                                                }
                                                funcDB.desconectar();
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
