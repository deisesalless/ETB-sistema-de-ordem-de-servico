<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página alterar cliente</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_cliente;
                if(formulario.nomeCompleto.value==""){
                    alert("O campo Nome Completo deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.telefone.value==""){
                    alert("O campo Telefone deve ser preenchido!");
                    formulario.telefone.focus();
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
                            <h2>Alterando Cadastro do Cliente</h2>
                            <form name="form_alterar_cliente" action="alterar_cliente.do" method="post" onsubmit="return validaForm();">
                            <table width="400" border="0">
                                <%
                                    // Atributo local, pega o Identificador que veio da página Listar Usuario
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        ClienteDAO clientDB = new ClienteDAO();
                                        clientDB.conectar();
                                        Cliente client = clientDB.pesquisarPorId(id);
                                        clientDB.desconectar();
                                        if (client.getPessoa().getId() > 0) {
                                %>
                                <tr width=>
                                    <td>ID:</td>
                                    <td>
                                        <%=client.getPessoa().getId()%>
                                        <input type="hidden" name="id" value="<%=client.getPessoa().getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nome:</td>
                                    <td>
                                        <input type="text" name="nomeCompleto" value="<%=client.getPessoa().getNomeCompleto()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Telefone:</td>
                                    <td>
                                        <input type="text" name="telefone" value="<%=client.getTelefone()%>" size="40">
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
