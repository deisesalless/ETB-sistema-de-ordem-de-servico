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
                formulario = document.form_cadastrar_cliente;
                if(formulario.nomeCompleto.value==""){
                    alert("O campo Nome deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
                    return false;
                }
                if(formulario.dataCadastro.value==""){
                    alert("O campo Data deve ser preenchido!");
                    formulario.dataCadastro.focus();
                    return false;
                }
                return true;
            }
        </script>
        <title>Página teste cadastrar Cliente</title>
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
                        <h2>Cadastrar Cliente</h2>
                        <form name="form_cadastrar_cliente" action="cadastrar_cliente.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Nome Completo:</td>
                                    <td><input type="text" name="nomeCompleto" size="30" /> </td>
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
                                    <td></td>
                                    <td><input type="submit" value="Salvar"> </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
