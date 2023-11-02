<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="entidade.Empresa"%>
<%@page import="persistencia.EmpresaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página alterar tabela de preços</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_tabela_preco;
                if(formulario.identificador.value==""){
                    alert("O campo Identificador deve ser preenchido!");
                    formulario.identificador.focus();
                    return false;
                }
                if(formulario.descricao.value==""){
                    alert("O campo Nome do Serviço deve ser preenchido!");
                    formulario.descricao.focus();
                    return false;
                }
                if(formulario.precoVeiculoPequeno.value==""){
                    alert("O campo Preço do Veículo Pequeno deve ser preenchido!!");
                    formulario.precoVeiculoPequeno.focus();
                    return false;
                }
                if(formulario.precoVeiculoMedio.value==""){
                    alert("O campo Preço do Veículo Medio deve ser preenchido!!");
                    formulario.precoVeiculoMedio.focus();
                    return false;
                }
                if(formulario.precoVeiculoGrande.value==""){
                    alert("O campo Preço do Veículo Grande deve ser preenchido!!");
                    formulario.precoVeiculoGrande.focus();
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
                            <h2>Alterando Tabela de Preços</h2>
                            <form name="form_alterar_tabela_preco" action="alterar_tabela_preco.do" method="post" onsubmit="return validaForm();">
                            <table width="500" border="0">
                                <%
                                    // Atributo local, pega o id que veio da página Listar Tabela de Preço
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    // Instancia um objeto e faz conectar ao banco de dados
                                    try {
                                        TabelaPrecoDAO tabelaPrecooDB = new TabelaPrecoDAO();
                                        DecimalFormat formato = new DecimalFormat("0.00");
                                        List<TabelaPreco> lista;
                                        tabelaPrecooDB.conectar();
                                        lista = tabelaPrecooDB.pesquisarPorId(id);
                                        tabelaPrecooDB.desconectar();
                                        for (TabelaPreco servico:lista){
                                %>
                                <tr>
                                    <td>ID:</td>
                                    <td>
                                        <%=servico.getId()%><input type="hidden" name="id" value="<%=servico.getId()%>" size="40">
                                    </td>
                                <tr>
                                <tr>
                                    <td>Nome do serviço:</td>
                                    <td>
                                        <input type="text" name="nome" value="<%=servico.getNome()%>" size="40">
                                    </td>
                                <tr>
                                <tr>
                                    <td>Preço do Veículo Pequeno:</td>
                                    <%
                                        Double precoPequenoVeiculo = servico.getPrecoVeiculoPequeno();
                                        String precoVeiculoPequeno = formato.format(precoPequenoVeiculo);
                                    %>
                                    <td>
                                        <input type="text" name="precoVeiculoPequeno" value="<%=precoVeiculoPequeno%>" size="40">
                                    </td>
                                <tr>
                                    <td>Preço do Veículo Médio:</td>
                                    <%
                                        Double precoMedioVeiculo = servico.getPrecoVeiculoMedio();
                                        String precoVeiculoMedio = formato.format(precoMedioVeiculo);
                                    %>
                                    <td>
                                        <input type="text" name="precoVeiculoMedio" value="<%=precoVeiculoMedio%>" size="40">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Preço do Veículo Grande:</td>
                                    <%
                                        Double precoGrandeVeiculo = servico.getPrecoVeiculoGrande();
                                        String precoVeiculoGrande = formato.format(precoGrandeVeiculo);
                                    %>
                                    <td>
                                        <input type="text" name="precoVeiculoGrande" value="<%=precoVeiculoGrande%>" size="40">
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
                                    <td><input type="submit" value="Alterar"></td>
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
