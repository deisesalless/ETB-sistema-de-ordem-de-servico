<%@page import="entidade.Empresa"%>
<%@page import="persistencia.EmpresaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar empresa</title>
        <script src="OnOff.js"></script>
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
                        <div align="center">
                            <h3>Cadastro da Empresa (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-empresa.jsp">Novo</a>)</h3>
                            <table width="860" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>CNPJ</td>
                                    <td>RAZAO SOCIAL</td>
                                    <td>NOME FANTASIA</td>
                                    <td>RESPONSAVEL</td>
                                    <td>DATA DO CADASTRO</td>
                                    <td>STATUS</td>
                                    <td>ALTERAR CADASTRO</td>
                                </tr>
                                <%                                            
                                    try {
                                        EmpresaDAO empDB = new EmpresaDAO();
                                        ArrayList<Empresa> lista;
                                        empDB.conectar();
                                        lista = empDB.listar();
                                        for(Empresa emp:lista){
                                %>
                                    <tr>
                                        <td><%=emp.getCnpj()%></td>
                                        <td><%=emp.getRazaoSocial()%></td>
                                        <td><%=emp.getNomeFantasia()%></td>
                                        <td><%=emp.getResponsavel()%></td>
                                        <td><%=DataUtility.DataUtility.formatarDataComPadrao(emp.getDataCadastro())%></td>
                                        <td>
                                            <% if (emp.isStatus()) { %>
                                                <!-- Já que está ativado permite desativar o status -->
                                                <form action="desativar_empresa.do" method="post">
                                                    <input type="hidden" name="cnpj" value="<%=emp.getCnpj()%>">
                                                    <input type="hidden" name="status" value="true">

                                                    <!-- Mostra a imagem de status ativo -->
                                                    <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                        <img src="./imagens/on.png" alt="imagem-online">
                                                    </button>
                                                 </form>
                                            <% } else { %>
                                                <!-- Já que está deativado permite ativar o status -->
                                                <form action="ativar_empresa.do" method="post">
                                                    <input type="hidden" name="cnpj" value="<%=emp.getCnpj()%>">
                                                    <input type="hidden" name="status" value="true">

                                                    <!-- Mostra a imagem de status desativado -->
                                                    <button id="botao-alterar-tema" type="submit" value="Ativar">
                                                        <img src="./imagens/off.png" alt="imagem-offline">
                                                    </button>
                                                 </form>
                                            <% } %>
                                        </td>
                                                                                                                           
                                        <td align="center">
                                            <a href="form-alterar-empresa.jsp?cnpj=<%=emp.getCnpj()%>"><img src="imagens/alterar.png" border="0"></a>
                                        </td>
                                    </tr>	
                                </tr>
                                <%
                                                }
                                                empDB.desconectar();
                                            } catch (Exception erro) {
                                                out.print(erro);
                                            }
                                %>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
