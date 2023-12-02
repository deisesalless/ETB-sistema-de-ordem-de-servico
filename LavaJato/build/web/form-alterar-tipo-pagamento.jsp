<%@page import="java.util.List"%>
<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
    
            function validaForm(){
                formulario = document.form_cadastrar_tipo_pagamento;
                
                formulario.nome.value = removerAcentos(formulario.nome.value);
                
                if(formulario.nome.value===""){
                    alert("O campo NOME deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                return true;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/perfil.css">
        <script src="javascript/On&Off.js"></script>
    </head>
    <body>
        <div id="overlay"></div>
        <div id="pagina">
            
            <div id="banner">
                <img src="imagens/banner.PNG" alt="banner">
            </div>
            
            <div id="menu">
                <%@include file="menu.jsp"%> 
            </div>
            
            <div id="principal">
                
                <div class="conteudo" align="center">
                    <h3> Alterar Forma de Pagamento </h3>
                    
                    <form name="form_alterar_tipo_pagamento" action="alterar_forma_pagamento.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                
                                try {
                                    FormaDePagamentoDAO tipo_pagDB = new FormaDePagamentoDAO();
                                    List<FormaDePagamento> lista;
                                    tipo_pagDB.conectar();
                                    lista = tipo_pagDB.pesquisarPorId(id);
                                    for (FormaDePagamento tipo_pag:lista) {
                            %>
                            <tr bgcolor="#d3d3d3">
                                <td>ID</td>
                                <td>Perfil</td>
                            </tr>

                            <tr>
                                <td>
                                    <%=tipo_pag.getServicoPreco().getId()%><input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                </td>
                                <td>
                                    <input type="text" name="nome" value="<%=tipo_pag.getServicoPreco().getNome()%>" size="100%">
                                </td>
                            </tr>
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
            </div>       
        </div>
    </body>
</html>