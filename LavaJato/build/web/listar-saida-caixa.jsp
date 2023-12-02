
<%@page import="java.util.Date"%>
<%@page import="entidade.FluxoDeCaixa"%>
<%@page import="persistencia.FluxoDeCaixaDAO"%>
<%@page import="entidade.FormaDePagamento"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Atendimento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="persistencia.AtendimentoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
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
            function validaForm(){
                formulario = document.form_cadastrar_valor_saida;
                if(formulario.nome.value===""){
                    alert("O campo DESCRIÇÃO deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.valor.value===""){
                    alert("O campo VALOR deve ser preenchido!!");
                    formulario.valor.focus();
                    return false;
                }
                return true;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/tabela-preco.css">
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
                    <h3>
                        Saída de Valores
                        <button id="mostrar-pop-up">+ Novo</button>
                    </h3>
                    <table width="900">
                        <tr bgcolor="#d3d3d3">
                            <td align="center" width="200">
                                Data & Hora
                            </td>
                            <td align="center">
                                Descrição
                            </td>
                            <td align="center">
                                Valor
                            </td>
                            <td align="center">
                                Excluir
                            </td>
                        </tr>

<%

    try {
            FluxoDeCaixaDAO fluxoDeCaixaDB = new FluxoDeCaixaDAO();
            fluxoDeCaixaDB.conectar();

            List<FluxoDeCaixa> lista = fluxoDeCaixaDB.listar();
            for(FluxoDeCaixa fluxoDeCaixa : lista) {
%>
                        <tr>
                            <td align="center">
<%
                    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    String dataCadastro = dataFormatada.format(fluxoDeCaixa.getData());
%>
                              <%=dataCadastro%>
                            </td>
                            <td align="center">
                                <%=fluxoDeCaixa.getDescricao()%>
                            </td>

<%
                    DecimalFormat formato = new DecimalFormat("0.00");
                    Double precoValorTotal = fluxoDeCaixa.getValor();
                    String valorTotalPreco = formato.format(precoValorTotal);
%>
                            
                            <td align="center">
                                <%=valorTotalPreco%>
                            </td>
                            
                            <td align="center">
                                <a href="excluir-saida-caixa.do?id=<%=fluxoDeCaixa.getId()%>">
                                    <button> excluir </button>
                                </a>
                            </td>
                            
<%
            }

            fluxoDeCaixaDB.desconectar();            
        } catch (Exception erro) {
            out.print(erro);
        }
%>
                        </tr>
                    </table>
                </div>
                
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Saída de Valores</h3>
                            <form name="form_cadastrar_valor_saida" action="cadastrar_valor_saida.do" method="post" onsubmit="return validaForm();">
                                                              
                            <%
                                Date hoje = new Date();
                                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                String dataCadastro = dataFormatada.format(hoje);
                            %>    
                                <label>Data:</label>
                                <%=dataCadastro%>
                                <input type="hidden" name="data" value="<%=dataCadastro%>"> <!-- repassa a data e hora para o java -->
                                <br>
                                
                                <label>Descrição:</label>
                                <input type="text" name="nome" placeholder="Digite o nome/motivo da saída" size="30">
                                
                                <label>Valor:</label>
                                <input type="text" name="valor" placeholder="Digite o valor" size="30">
                                
                                <div class="botao-salvar-formulario">
                                    <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                                </div>
                            </form> 
                        </div>
                    <script>
                        // Comando para mostrar o Pop-up utilizando JavaScript
                        document.querySelector("#mostrar-pop-up").addEventListener("click", function() {
                            document.querySelector("#pop-up").classList.add("ativo");
                            document.querySelector("#overlay").style.display = "block";
                        });

                        // Comando para fechar o Pop-up utilizando JavaScript
                        document.querySelector("#pop-up .botao-fechar").addEventListener("click", function() {
                            document.querySelector("#pop-up").classList.remove("ativo");
                             document.querySelector("#overlay").style.display = "none";
                        });
                    </script>
                </div>
            </div>       
        </div>
    </body>
</html>