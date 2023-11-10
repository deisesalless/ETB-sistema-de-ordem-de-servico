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
            function validaForm(){
                formulario = document.form_cadastrar_perfil;
                if(formulario.nome.value===""){
                    alert("O campo PERFIL deve ser preenchido!");
                    formulario.nome.focus();
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
                    
                    <form name="form_alterar_perfil" action="alterar_perfil.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                
                                try {
                                    PerfilDAO perfilDB = new PerfilDAO();
                                    perfilDB.conectar();
                                    Perfil perfil = perfilDB.pesquisarPorId(id);
                            %>
                            <tr bgcolor="#d3d3d3">
                                <td>ID</td>
                                <td>Perfil</td>
                            </tr>

                            <tr>
                                <td>
                                    <%=perfil.getId()%><input type="hidden" name="id" value="<%=perfil.getId()%>">
                                </td>
                                <td>
                                    <input type="text" name="nome" value="<%=perfil.getNome()%>" size="100%">
                                </td>
                            </tr>
                            <%
                                perfilDB.desconectar();
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