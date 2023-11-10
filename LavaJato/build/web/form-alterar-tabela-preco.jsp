<%@page import="entidade.TabelaPreco"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_alterar_tabela_preco;
                if(formulario.identificador.value===""){
                    alert("O campo Identificador deve ser preenchido!");
                    formulario.identificador.focus();
                    return false;
                }
                if(formulario.descricao.value===""){
                    alert("O campo Nome do Serviço deve ser preenchido!");
                    formulario.descricao.focus();
                    return false;
                }
                if(formulario.precoVeiculoPequeno.value===""){
                    alert("O campo Preço do Veículo Pequeno deve ser preenchido!!");
                    formulario.precoVeiculoPequeno.focus();
                    return false;
                }
                if(formulario.precoVeiculoMedio.value===""){
                    alert("O campo Preço do Veículo Medio deve ser preenchido!!");
                    formulario.precoVeiculoMedio.focus();
                    return false;
                }
                if(formulario.precoVeiculoGrande.value===""){
                    alert("O campo Preço do Veículo Grande deve ser preenchido!!");
                    formulario.precoVeiculoGrande.focus();
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
                    <h3> Alterar Tabela de Preços </h3>
                    
                    <form name="form_alterar_tabela_preco" action="alterar_tabela_preco.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                
                                try {
                                    TabelaPrecoDAO tabelaPrecooDB = new TabelaPrecoDAO();
                                    DecimalFormat formato = new DecimalFormat("0.00");
                                    List<TabelaPreco> lista;
                                    tabelaPrecooDB.conectar();
                                    lista = tabelaPrecooDB.pesquisarPorId(id);
                                    tabelaPrecooDB.desconectar();
                                    for (TabelaPreco servico:lista) {
                            %>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    ID
                                </td>
                                <td>
                                    <%=servico.getId()%><input type="hidden" name="id" value="<%=servico.getId()%>">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Nome do serviço
                                </td>
                                <td>
                                    <input type="text" name="nome" value="<%=servico.getNome()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Preço do Veículo Pequeno
                                </td>
                                <%
                                    Double precoPequenoVeiculo = servico.getPrecoVeiculoPequeno();
                                    String precoVeiculoPequeno = formato.format(precoPequenoVeiculo);
                                %>
                                <td>
                                    <input type="text" name="precoVeiculoPequeno" value="<%=precoVeiculoPequeno%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Preço do Veículo Medio
                                </td>
                                <%
                                    Double precoMedioVeiculo = servico.getPrecoVeiculoMedio();
                                    String precoVeiculoMedio = formato.format(precoMedioVeiculo);
                                %>
                                <td>
                                    <input type="text" name="precoVeiculoMedio" value="<%=precoVeiculoMedio%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Preço do Veículo Grande
                                </td>
                                <%
                                    Double precoGrandeVeiculo = servico.getPrecoVeiculoGrande();
                                    String precoVeiculoGrande = formato.format(precoGrandeVeiculo);
                                %>
                                <td>
                                    <input type="text" name="precoVeiculoGrande" value="<%=precoVeiculoGrande%>" size="50%">
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
            </div>       
        </div>
    </body>
</html>