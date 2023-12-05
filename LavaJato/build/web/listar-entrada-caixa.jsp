<%@page import="entidade.FormaDePagamento"%>
<%@page import="entidade.Atendimento"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="persistencia.AtendimentoDAO"%>
<%@page import="entidade.Funcionario"%>
<%@page import="persistencia.FuncionarioDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Página Listar Entrada de Valores no Fluxo de Caixa </title>
        <link rel="stylesheet" href="estilo_layout/pop-up-usuario.css">
        <link rel="stylesheet" href="estilo_layout/perfil.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
    </head>
    <body>
        <div id="overlay"></div>
        <div class="container">
             <!-- Cabeçalho da página -->
            <div class="top-section">
                <div class="logo-section">
                    <img src="imagens_site/logo.png" alt="Logo Lava Jato" class="logo">
                </div>
                <div class="title">
                    Lava Jato
                </div>
                <div>
                    <!-- Botão de sair -->
                    <a href="sair.jsp"> <button class="logout-button"> Sair </button> </a>
                </div>
            </div>

            <div class="menu-section">
                <!-- Menu da página -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção da tabela -->
            <div class="table-section">
                <h1 class="page-title">
                    Entrada de Valores - Fluxo de Caixa
                </h1>

                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Data e Hora</td>
                        <td style="text-align: center; font-weight: bold;">Descrição</td>
                        <td style="text-align: center; font-weight: bold;">Tipo de Entrada</td>
                        <td style="text-align: center; font-weight: bold;">Valor</td>
                    </tr>

                    <!-- Dados da tabela -->
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
                            if (atendimento.isStatusAtendimento() == false) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: center;">
<%
                                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                String dataCadastro = dataFormatada.format(atendimento.getData());
%>                          <%=dataCadastro%>
                        </td>
                        <td style="text-align: center;">
                            Ordem de Serviço n° <%=atendimento.getId()%>
                        </td>
                        <td style="text-align: center;">
<%
                                ArrayList<FormaDePagamento> list = formaPagamentoDB.listar();
                                for(FormaDePagamento formaPagamento : list) {
                                    if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaPagamento.getServicoPreco().getId()) {
%>
                            <%=formaPagamento.getServicoPreco().getNome()%>
                        </td>

                        <td style="text-align: center;">
<%
                                    }
                                }
                                DecimalFormat formato = new DecimalFormat("0.00");
                                Double precoValorTotal = atendimento.getValorTotal();
                                String valorTotalPreco = formato.format(precoValorTotal);
%>
                            <%=valorTotalPreco%>
                        </td>
                    </tr>
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
                </table>
            </div>
            <!-- Informações adicionais -->
            <div class="info-section">
                <div class="info-item">
                    <label>Endereço:</label>
                    <span>Quadra 42 Lote 51A Parque Araguari I, Cidade Ocidental - GO, 72.885-234</span>
                </div>
                <div class="info-item">
                    <label>Telefone:</label>
                    <span>(61) 3605-3474</span>
                    <img src="imagens_site/logo-whatsapp.png" alt="Logo Instagram">
                </div>
                <div class="info-item">
                    <label>Instagram:</label>
                    <span> @lavajato</span>
                    <img src="imagens_site/logo-instagram.png" alt="Logo Instagram">
                </div>
            </div>
        </div>
    </body>
</html>
