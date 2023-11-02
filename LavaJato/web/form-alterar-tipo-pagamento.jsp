<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
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
                formulario = document.form_alterar_tipo_pagamento;
                if(formulario.nome.value==""){
                    alert("O campo Tipo De Pagamento deve ser preenchido!!");
                    formulario.nome.focus();
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
                            <h2>Alterando Forma de Pagamento</h2>
                            <form name="form_alterar_tipo_pagamento" action="alterar_forma_pagamento.do" method="post" onsubmit="return validaForm();">
                            <table width="600" border="0">
                                <%
                                    // Atributo local, pega o Id que veio da página Listar Formas de Pagamento
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e conecta ao banco de dados
                                    try {
                                        FormaDePagamentoDAO tipo_pagDB = new FormaDePagamentoDAO();
                                        List<FormaDePagamento> lista;
                                        tipo_pagDB.conectar();
                                        lista = tipo_pagDB.pesquisarPorId(id);
                                        for (FormaDePagamento tipo_pag:lista){
                                %>
                                <tr width=>
                                    <td>ID:</td>
                                    <td>
                                        <%=tipo_pag.getServicoPreco().getId()%>
                                        <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tipo De Pagamento:</td>
                                    <td>
                                        <input type="text" name="nome" value="<%=tipo_pag.getServicoPreco().getNome()%>">
                                    </td>

                                        <%
                                            }
                                            tipo_pagDB.desconectar();
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
