<%@page import="java.util.ArrayList"%>
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
                formulario = document.form_cadastrar_empresa;
                if(formulario.cnpj.value==""){
                    alert("O campo CNPJ deve ser preenchido!!");
                    formulario.cnpj.focus();
                    return false;
                }
                if(formulario.razaoSocial.value==""){
                    alert("O campo Razão Social deve ser preenchido!!");
                    formulario.razaoSocial.focus();
                    return false;
                }
                if(formulario.nomeFantasia.value==""){
                    alert("O campo Nome Fantasia deve ser preenchido!!");
                    formulario.nomeFantasia.focus();
                    return false;
                }
                if(formulario.responsavel.value==""){
                    alert("O campo Nome do Responsável deve ser preenchido!!");
                    formulario.responsavel.focus();
                    return false;
                }
                if(formulario.dataCadastro.value==""){
                    alert("O campo Data deve ser preenchido!!");
                    formulario.dataCadastro.focus();
                    return false;
                }
                return true;
            }
        </script>
        <title>Página teste cadastrar Empresa</title>
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
                    <td width="760" height="330"align="center">
                        <h2>Cadastrar Empresa</h2>
                        <form name="form_cadastrar_empresa" action="cadastrar_empresa.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>CNPJ:</td>
                                    <td><input type="text" name="cnpj" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Razão Social:</td>
                                    <td><input type="text" name="razaoSocial" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Nome Fantansia:</td>
                                    <td><input type="text" name="nomeFantasia" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Nome do Responsável:</td>
                                    <td><input type="text" name="responsavel" size="30" /> </td>
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
