<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_usuario;
                if(formulario.nomeCompleto.value===""){
                    alert("O campo NOME COMPLETO deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.login.value===""){
                    alert("O campo LOGIN deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value===""){
                    alert("O campo SENHA deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }
                if(formulario.id_perfil.value===""){
                    alert("O campo PERFIL deve ser preenchido!");
                    formulario.id_perfil.focus();
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
                    <h3> Alterar Usuario </h3>
                    
                    <form name="form_alterar_usuario" action="alterar_usuario.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                
                                try {
                                    UsuarioDAO uDB = new UsuarioDAO();
                                    uDB.conectar();
                                    List<Usuario> usu;
                                    usu = uDB.pesquisarPorId(id);
                                    uDB.desconectar();
                                    for (Usuario usuarioo:usu) {
                                        if (usuarioo.getPessoa().getId() > 0){
                            %>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    ID
                                </td>
                                <td>
                                    <%=usuarioo.getPessoa().getId()%>
                                    <input type="hidden" name="id" value="<%=usuarioo.getPessoa().getId()%>">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Nome Completo
                                </td>
                                <td>
                                    <input type="text" name="nomeCompleto" value="<%=usuarioo.getPessoa().getNomeCompleto()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Perfil
                                </td>
                                <td>
                                    <select name="id_perfil">
                                        <option value="" selected>Escolha um Perfil</option>
                                        <!-- Cria um objeto, e um atributo lista para conectar com o 
                                        // banco de dados e trazer a lista de nomes do perfil -->
                                        <%
                                            try {
                                                PerfilDAO pDB = new PerfilDAO();
                                                ArrayList<Perfil> lista;
                                                pDB.conectar();
                                                lista = pDB.listar();
                                                // Lista os perfis
                                                for(Perfil perfill:lista) {
                                                    // Se o perfil tiver ativo pode ser utilizado
                                                    if (perfill.isStatus()) {
                                        %>
                                        <option value="<%=perfill.getId()%>"><%=perfill.getNome()%></option>
                                        <% 
                                                    }
                                                } 
                                                pDB.desconectar();
                                            } catch (Exception erro) {
                                                out.print(erro);
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Usuario
                                </td>
                                <td>
                                    <input type="text" name="login" value="<%=usuarioo.getLogin()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Senha
                                </td>
                                <td>
                                    <input type="password" name="senha" value="<%=usuarioo.getSenha()%>" size="50%">
                                </td>
                            </tr>
                            <%
                                        }
                                    }
                                    uDB.desconectar();
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