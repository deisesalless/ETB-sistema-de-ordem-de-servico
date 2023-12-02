<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="entidade.Atendimento"%>
<%@page import="entidade.Atendimento"%>
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
        <title>Listar Entrada de Valores Fluxo de Caixa</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/tabela-preco.css">
        <script src="javascript/On&Off.js"></script>
    </head>
    <body>
        <div id="pagina">
            
            <div id="banner">
                <img src="imagens/banner.PNG" alt="banner">
            </div>
            
            <div id="menu">
                <%@include file="menu.jsp"%> 
            </div>
            
            <div id="principal">
                
                <div class="conteudo" align="center">
                    <h3> Entrada de Valores </h3>
                    
                    <table width="900">
                        <tr bgcolor="#d3d3d3">
                            <td align="center" width="200">
                                Data & Hora
                            </td>
                            <td align="center">
                                Descrição
                            </td>
                            <td align="center">
                                Tipo de Entrada
                            </td>
                            <td align="center">
                                Valor
                            </td>
                        </tr>

<%

    try {
            AtendimentoDAO atendimentoDB = new AtendimentoDAO();
            FormaDePagamentoDAO formaPagamentoDB = new FormaDePagamentoDAO();
            TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
            
            atendimentoDB.conectar();
            formaPagamentoDB.conectar();
            tabelaPrecoDB.conectar();
            
            
            
            
            List<Atendimento> lista = atendimentoDB.listar();
            for(Atendimento atendimento : lista) {
                if (atendimento.isStatusAtendimento() == false){
%>
                        <tr>
                            <td align="center">
<%
                    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    String dataCadastro = dataFormatada.format(atendimento.getData());
%>
                              <%=dataCadastro%>
                            </td>
                            <td align="center">
                                Ordem de Serviço n° <%=atendimento.getId()%>
                            </td>
                            
<%
                    ArrayList<FormaDePagamento> list = formaPagamentoDB.listar();
                    for(FormaDePagamento formaPagamento : list) {
                        if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaPagamento.getServicoPreco().getId()) {
%>

                            <td align="center">
                                <%=formaPagamento.getServicoPreco().getNome()%>
                            </td>
<%
                        }
                    }
                    DecimalFormat formato = new DecimalFormat("0.00");
                    Double precoValorTotal = atendimento.getValorTotal();
                    String valorTotalPreco = formato.format(precoValorTotal);
%>
                            
                            <td align="center">
                                <%=valorTotalPreco%>
                            </td>
<%
                }
            }

            formaPagamentoDB.desconectar();
            tabelaPrecoDB.desconectar();
            atendimentoDB.desconectar();            
        } catch (Exception erro) {
            out.print(erro);
        }
%>
                        </tr>
                    </table>
                </div>
            </div>       
        </div>
    </body>
</html>