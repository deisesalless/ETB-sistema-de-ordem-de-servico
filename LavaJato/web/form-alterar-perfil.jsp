<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="entidade.Empresa"%>
<%@page import="persistencia.EmpresaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página alterar veiculo</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_perfil;
                if(formulario.nome.value==""){
                    alert("O campo Perfil deve ser preenchido!");
                    formulario.nome.focus();
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
                            <h2>Alterar nome do Perfil</h2>
                            <form name="form_alterar_perfil" action="alterar_perfil.do" method="post" onsubmit="return validaForm();">
                            <table width="600" border="0">
                                <%
                                    // Atributo local, pega o id que veio da página Listar Perfil
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        PerfilDAO perfDB = new PerfilDAO();
                                        perfDB.conectar();
                                        List<Perfil> lista;
                                        lista = perfDB.pesquisarPorId(id);
                                        perfDB.desconectar();
                                        for (Perfil profile:lista){
                                %>
                                <tr width=>
                                    <td>ID:</td>
                                    <td>
                                        <%=profile.getId()%>
                                        <input type="hidden" name="id" value="<%=profile.getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Perfil:</td>
                                    <td>
                                        <input type="text" name="nome" value="<%=profile.getNome()%>">
                                    </td>
                                </tr>
                                        <%
                                            }
                                            perfDB.desconectar();
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
