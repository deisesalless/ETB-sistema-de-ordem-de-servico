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
                formulario = document.form_alterar_empresa;
                if(formulario.razaoSocial.value==""){
                    alert("O campo Razão Social deve ser preenchido!");
                    formulario.razaoSocial.focus();
                    return false;
                }
                if(formulario.nomeFantasia.value==""){
                    alert("O campo Nome Fantasia deve ser preenchido!");
                    formulario.nomeFantasia.focus();
                    return false;
                }
                if(formulario.responsavel.value==""){
                    alert("O campo Nome do Responsável deve ser preenchido!");
                    formulario.responsavel.focus();
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
                            <h2>Alterando Cadastro da Empresa</h2>
                            <form name="form_alterar_empresa" action="alterar_empresa.do" method="post" onsubmit="return validaForm();">
                            <table width="600" border="0">
                                <%
                                    // Atributo local, pega o CNPJ que veio da página Listar Empresa
                                    String cnpj = request.getParameter("cnpj");
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        EmpresaDAO empDB = new EmpresaDAO();
                                        List<Empresa> lista;
                                        empDB.conectar();
                                        lista = empDB.pesquisarPorCNPJ(cnpj);
                                        for (Empresa emp:lista){
                                %>
                                <tr width=>
                                    <td>CNPJ:</td>
                                    <td>
                                        <%=emp.getCnpj()%>
                                        <input type="hidden" name="cnpj" value="<%=emp.getCnpj()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Razão Social:</td>
                                    <td>
                                        <input type="text" name="razaoSocial" value="<%=emp.getRazaoSocial()%>">
                                    </td>
                                <tr>
                                   <td>Nome Fantasia:</td>
                                    <td>
                                        <input type="text" name="nomeFantasia" value="<%=emp.getNomeFantasia()%>">
                                    </td> 
                                </tr>
                                
                                <tr>
                                    <td>Nome do Responsável:</td>
                                    <td>
                                        <input type="text" name="responsavel" value="<%=emp.getResponsavel()%>">
                                    </td>
                                </tr>
                                        <%
                                            }
                                            empDB.desconectar();
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
