<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página index de Teste</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_usuario_senha;
                if(formulario.usuario.value==""){
                    alert("O campo Usuario deve ser preenchido!");
                    formulario.usuario.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O campo Senha deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <img src="imagens/banner.PNG" alt="banner">
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
                            <h2>Alterando Usuario/Senha do Usuario</h2>
                            <form name="form_alterar_usuario_senha" action="alterar_senha_usuario.do" method="post" onsubmit="return validaForm();">
                            <table width="400" border="0">
                                <%
                                    // Atributo local, pega o Identificador que veio da página Listar Usuario
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        UsuarioDAO uDB = new UsuarioDAO();
                                        uDB.conectar();
                                        usuario = uDB.pesquisarPorId(id);
                                        uDB.desconectar();
                                        if (usuario.getPessoa().getId() > 0){
                                %>
                                <tr width=>
                                    <td>ID:</td>
                                    <td>
                                        <%=usuario.getPessoa().getId()%>
                                        <input type="hidden" name="id" value="<%=usuario.getPessoa().getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Usuario:</td>
                                    <td>
                                        <input type="text" name="login" value="<%=usuario.getLogin()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Senha:</td>
                                    <td>
                                        <input type="password" name="senha" value="<%=usuario.getSenha()%>" size="40">
                                    </td>
                                </tr>
                                        <%
                                            }
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
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
