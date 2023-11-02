<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_cadastrar_veiculo;
                if(formulario.placa.value==""){
                    alert("O campo Placa deve ser preenchido!");
                    formulario.placa.focus();
                    return false;
                }
                if(formulario.cor.value==""){
                    alert("O campo Cor deve ser preenchido!");
                    formulario.cor.focus();
                    return false;
                }
                if(formulario.marca.value==""){
                    alert("O campo Marca deve ser preenchido!");
                    formulario.marca.focus();
                    return false;
                }
                if(formulario.id_cliente.value==""){
                    alert("O ID do cliente deve ser preenchido!");
                    formulario.id_cliente.focus();
                    return false;
                }
                return true;
            }
        </script>
        <title>Página teste cadastrar Veiculo</title>
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
                        <form name="form_cadastrar_veiculo" action="cadastrar_veiculo.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <%
                                    // Atributo local, pega o Id que veio da página cadastrar Cliente
                                    int id = Integer.parseInt(request.getParameter("id_cliente"));
                                    
                                    try {
                                        
                                        ClienteDAO clientDB = new ClienteDAO();
                                        clientDB.conectar();
                                        Cliente client = clientDB.pesquisarPorId(id);
                                        clientDB.desconectar();
                                        if (client.getPessoa().getId() > 0) {

                                %>
                                <tr>
                                    <td>ID do cliente:</td>
                                    <td>
                                        <%=client.getPessoa().getId()%>
                                        <input type="hidden" name="id_cliente" value="<%=client.getPessoa().getId()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nome Completo do Cliente:</td>
                                    <td>
                                        <%=client.getPessoa().getNomeCompleto()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Marca do veículo:</td>
                                    <td><input type="text" name="marca" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Cor:</td>
                                    <td><input type="text" name="cor" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td>Placa:</td>
                                    <td><input type="text" name="placa" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Salvar" /> </td>
                                </tr>
                                <%
                                    }
                                        clientDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
