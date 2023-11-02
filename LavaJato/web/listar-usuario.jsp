<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar usuario</title>
        <script src="OnOff.js"></script>
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
                            <h3>Lista de Usuários (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-usuario.jsp">Novo</a>)</h3>
                            <table width="860" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>NOME COMPLETO</td>
                                    <td>LOGIN</td>
                                    <td>PERFIL</td>
                                    <td>CADASTRO</td>
                                    <td>SENHA</td>
                                    <td>STATUS</td>
                                </tr>
                                <%                                            
                                    try {
                                        UsuarioDAO uDB = new UsuarioDAO();
                                        ArrayList<Usuario> lista;
                                        uDB.conectar();
                                        lista = uDB.listar();
                                        for(Usuario usuar:lista){
                                %>
                                    <tr>
                                        <td><%=usuar.getPessoa().getId()%></td>
                                        <td><%=usuar.getPessoa().getNomeCompleto()%></td>
                                        <td><%=usuar.getLogin() %></td>
                                        <td>
                                            <%
                                                // Atributo local, pega o Id do perfil do usuario
                                                int id = usuar.getPerfil().getId();
                                                // Instancia um objeto e faz conectar ao banco de dados
                                                try {
                                                    PerfilDAO perfilBD = new PerfilDAO();
                                                    perfilBD.conectar();
                                                    Perfil perf = perfilBD.pesquisarPorId(id);
                                                    perfilBD.desconectar();
                                             %>        
                                                    <%=perf.getNome()%>
                                            <%
                                                } catch (Exception erro) {
                                                     out.print(erro);
                                                }
                                            %>
                                        </td>
                                        <td align="center"><a href="form-alterar-cadastro-usuario.jsp?id=<%=usuar.getPessoa().getId()%>"><img src="imagens/alterar.png" border="0"></a></td>
                                        <td align="center"><a href="form-alterar-usuario-senha.jsp?id=<%=usuar.getPessoa().getId()%>"><img src="imagens/alterar.png" border="0"></a></td>
                                        <td align="center">
                                            <% if (usuar.getPerfil().isStatus()) { %>
                                                <!-- Já que está ativado permite desativar o status -->
                                                <form action="desativar_usuario.do" method="post">
                                                    <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                                    <input type="hidden" name="status" value="true">

                                                    <!-- Mostra a imagem de status ativo -->
                                                    <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                        <img src="./imagens/on.png" alt="imagem-online">
                                                    </button>
                                                 </form>
                                            <% } else { %>
                                                <!-- Já que está deativado permite ativar o status -->
                                                <form action="ativar_usuario.do" method="post">
                                                    <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                                    <input type="hidden" name="status" value="true">

                                                    <!-- Mostra a imagem de status desativado -->
                                                    <button id="botao-alterar-tema" type="submit" value="Ativar">
                                                        <img src="./imagens/off.png" alt="imagem-offline">
                                                    </button>
                                                 </form>
                                            <% } %>
                                        </td>
                                    </tr>	
                                </tr>
                                <%
                                                }
                                                uDB.desconectar();
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
