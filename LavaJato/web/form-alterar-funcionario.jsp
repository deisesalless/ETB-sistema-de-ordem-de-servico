<%@page import="entidade.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="persistencia.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página index de Teste</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_funcionario;
                if(formulario.nomeCompleto.value==""){
                    alert("O campo Nome Completo deve ser preenchido!!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.apelido.value==""){
                    alert("O campo Apelido deve ser preenchido!!");
                    formulario.apelido.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!!");
                    formulario.telefone.focus();
                    return false;
                }
                if(formulario.id_perfil.value==""){
                    alert("O campo Perfil deve ser preenchido!!");
                    formulario.id_perfil.focus();
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
                            <h2>Alterando Cadastro do Funcionario</h2>
                            <form name="form_alterar_funcionario" action="alterar_funcionario.do" method="post" onsubmit="return validaForm();">
                            <table width="400" border="0">
                                <%
                                    // Atributo local, pega o Identificador que veio da página Listar Usuario
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        FuncionarioDAO funcDB = new FuncionarioDAO();
                                        funcDB.conectar();
                                        Funcionario func = funcDB.pesquisarPorId(id);
                                        funcDB.desconectar();
                                        if (id > 0) {
                                %>
                                <tr width=>
                                    <td>ID:</td>
                                    <td>
                                        <%=func.getPessoa().getId()%>
                                        <input type="hidden" name="id" value="<%=func.getPessoa().getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Perfil:</td>
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
                                                    for(Perfil perfill:lista){
                                                        // Se o perfil tiver ativo pode ser utilizado
                                                        if (perfill.isStatus()) {
                                            %>
                                            <option value="<%=perfill.getId()%>"><%=perfill.getNome()%></option>
                                            <%          }
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
                                    <td>Nome:</td>
                                    <td>
                                        <input type="text" name="nomeCompleto" value="<%=func.getPessoa().getNomeCompleto()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Apelido:</td>
                                    <td>
                                        <input type="text" name="apelido" value="<%=func.getApelido()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td>
                                        <input type="text" name="telefone" value="<%=func.getTelefone()%>" size="40">
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
