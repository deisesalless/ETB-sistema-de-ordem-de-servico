<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de listar Formas de Pagamento</title>
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
                            <h3>Lista de Formas de Pagamento (<img src="imagens/novo.png" align="top"><a href="form-cadastrar-tipo-pagamento.jsp">Novo</a>)</h3>
                            <table width="550" border="1">
                                <tr bgcolor="#d3d3d3">
                                    <td>ID</td>
                                    <td>PAGAMENTO</td>
                                    <td>ALTERAR</td>
                                    <td>STATUS</td>
                                </tr>
                                <%                                            
                                    try {
                                        FormaDePagamentoDAO tipo_pagDB = new FormaDePagamentoDAO();
                                        ArrayList<FormaDePagamento> lista;
                                        tipo_pagDB.conectar();
                                        lista = tipo_pagDB.listar();
                                        for(FormaDePagamento tipo_pag:lista) {
                                %>
                                        <tr>
                                            <td><%=tipo_pag.getServicoPreco().getId()%></td>
                                            <td><%=tipo_pag.getServicoPreco().getNome()%></td>
                                            <td align="center">
                                                <a href="form-alterar-tipo-pagamento.jsp?id=<%=tipo_pag.getServicoPreco().getId()%>"><img src="imagens/alterar.png" border="0"></a>
                                            </td>
                                            <td align="center">
                                                <% if (tipo_pag.getServicoPreco().isStatus()) { %>
                                                    
                                                    <!-- Já que está ativado permite desativar o status -->
                                                    <form action="desativar_pagamento.do" method="post">
                                                        <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                                        <input type="hidden" name="status" value="true">
                                                        
                                                        <!-- Mostra a imagem de status ativo -->
                                                        <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                            <img src="./imagens/on.png" alt="imagem-online">
                                                        </button>
                                                    </form>
                                                        
                                                <% } else { %>
                                                    
                                                    <!-- Já que está desativado permite ativar o status -->
                                                    <form action="ativar_pagamento.do" method="post">
                                                        <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                                        <input type="hidden" name="status" value="true">
                                                        
                                                        <!-- Mostra a imagem de status desativado -->
                                                        <button id="botao-alterar-tema" type="submit" value="ativar">
                                                            <img src="./imagens/off.png" alt="imagem-offline">
                                                        </button>
                                                    </form>
                                                <% } %>
                                            </td>
                                <%
                                    }
                                    tipo_pagDB.desconectar();
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