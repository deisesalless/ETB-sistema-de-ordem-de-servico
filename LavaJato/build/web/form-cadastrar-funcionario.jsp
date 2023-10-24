<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_cadastrar_funcionario;
                if(formulario.nome.value==""){
                    alert("O campo Nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.sobrenome.value==""){
                    alert("O campo Nome deve ser preenchido!!");
                    formulario.sobrenome.focus();
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
                if(formulario.dataCadastro.value==""){
                    alert("O campo Data deve ser preenchido!!");
                    formulario.dataCadastro.focus();
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
        <title>Página teste cadastrar Funcionario</title>
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
                        <form name="form_cadastrar_funcionario" action="cadastrar_funcionario.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Nome:</td>
                                    <td><input type="text" name="nome" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Sobrenome:</td>
                                    <td><input type="text" name="sobrenome" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Apelido:</td>
                                    <td><input type="text" name="apelido" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td><input type="text" name="telefone" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Data do cadastro:</td>
                                <%
                                    Date hoje = new Date();
                                    DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                    String dataCadastro = dataFormatada.format(hoje);
                                %>
                                    <td><%=dataCadastro%><input type="hidden" name="dataCadastro" value="<%=dataCadastro%>"></td>
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
                                    <td></td>
                                    <td><input type="submit" value="Salvar" /> </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
