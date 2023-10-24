<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Veiculo"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página alterar veiculo</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_veiculo;
                if(formulario.marca.value==""){
                    alert("O campo Marca deve ser preenchido!");
                    formulario.marca.focus();
                    return false;
                }
                if(formulario.cor.value==""){
                    alert("O campo Cor deve ser preenchido!");
                    formulario.cor.focus();
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
                            <h2>Alterando Cadastro do Veiculo</h2>
                            <form name="form_alterar_veiculo" action="alterar_veiculo.do" method="post" onsubmit="return validaForm();">
                            <table width="600" border="0">
                                <%
                                    // Atributo local, pega a placa do veiculo que veio da página Listar Veiculo
                                    String placa = request.getParameter("placa");
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        VeiculoDAO veicDB = new VeiculoDAO();
                                        List<Veiculo> lista;
                                        veicDB.conectar();
                                        lista = veicDB.pesquisarPorPlaca(placa);
                                        for (Veiculo veic:lista){
                                %>
                                <tr width=>
                                    <td>ID do Cliente:</td>
                                    <td>
                                        <%=veic.getCliente().getPessoa().getId()%>
                                        <input type="hidden" name="id" value="<%=veic.getCliente().getPessoa().getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Nome do cliente:</td>
                                    <%
                                        try {
                                            ClienteDAO clienteDB = new ClienteDAO();
                                            ArrayList <Cliente> listaa;
                                            clienteDB.conectar();
                                            listaa = clienteDB.listar();
                                            for(Cliente client:listaa) {
                                                if (veic.getCliente().getPessoa().getId() == client.getPessoa().getId()) {
                                    %>
                                    <td>
                                        <%=client.getPessoa().getNome()%>
                                        <input type="hidden" name="nome" value="<%=client.getPessoa().getNome()%>">
                                    </td>
                                    <%
                                                }
                                        } 
                                            clienteDB.desconectar();
                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                    %>
                                </tr>
                                <tr>
                                    <td>Placa:</td>
                                    <td>
                                        <%=veic.getPlaca()%>
                                        <input type="hidden" name="placa" value="<%=veic.getPlaca()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cor:</td>
                                    <td>
                                        <input type="text" name="cor" value="<%=veic.getCor()%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Marca:</td>
                                    <td>
                                        <input type="text" name="marca" value="<%=veic.getMarca()%>" size="40">
                                    </td>
                                </tr>
                                        <%
                                            }
                                            veicDB.desconectar();
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
