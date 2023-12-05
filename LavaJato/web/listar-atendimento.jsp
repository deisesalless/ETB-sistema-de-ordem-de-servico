<%@page import="entidade.FormaDePagamento"%>
<%@page import="entidade.Veiculo"%>
<%@page import="entidade.Cliente"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="entidade.Atendimento"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page import="persistencia.VeiculoDAO"%>
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
        <title>Página Listar Atendimento</title>
        <link rel="stylesheet" href="estilo_layout/listar-atendimento.css">
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
                    Atendimentos em Andamento
                </h1>

<%                                            
                    try {
                            AtendimentoDAO atendimentoDB = new AtendimentoDAO();
                            VeiculoDAO veiculoDB = new VeiculoDAO();
                            ClienteDAO  clienteDB = new ClienteDAO();
                            UsuarioDAO  usuarioDB = new UsuarioDAO();
                            TabelaPrecoDAO precoDB = new TabelaPrecoDAO();
                            FormaDePagamentoDAO formaDePagamentoBD = new FormaDePagamentoDAO();
                            FuncionarioDAO funcionarioDB = new FuncionarioDAO();

                            usuarioDB.conectar();
                            atendimentoDB.conectar();
                            funcionarioDB.conectar();
                            veiculoDB.conectar();
                            clienteDB.conectar();
                            precoDB.conectar();
                            formaDePagamentoBD.conectar();
                            
                            List<Atendimento> lista = atendimentoDB.listar();
                            // Ordenar a lista de atendimentos por data
                            Collections.sort(lista, new Comparator<Atendimento>() {
                                @Override
                                public int compare(Atendimento a1, Atendimento a2) {
                                    return a1.getData().compareTo(a2.getData());
                                }
                            });
                            for(Atendimento atendimento : lista) {
                                if (atendimento.isStatusAtendimento() == true) {
                                        ArrayList<Cliente> list = clienteDB.listar();
                                        for(Cliente cliente : list) {
                                            if (atendimento.getCliente().getPessoa().getId() == cliente.getPessoa().getId()){
                                                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                                String dataCadastro = dataFormatada.format(atendimento.getData());
                                                
                                                    ArrayList<Veiculo> l = veiculoDB.listar();
                                                    for(Veiculo veiculo : l) {
                                                        if (atendimento.getVeiculo().getId() == veiculo.getId()) {                                                
%>

                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Data de Abertura</td>
                        <td style="text-align: center; font-weight: bold;">Telefone</td>
                        <td style="text-align: center; font-weight: bold; width: 350px;">Cliente</td>
                        <td style="text-align: center; font-weight: bold;">Placa e Modelo do Veículo</td>
                    </tr>

                    <!-- Dados da tabela -->
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: center;">
                            <%=dataCadastro%>
                        </td>
                        <td style="text-align: center;">
                            <%=cliente.getTelefone()%>
                        </td>
                        <td style="text-align: center;">
                            <%=cliente.getPessoa().getNomeCompleto()%>
                        </td>
                        <td style="text-align: center;"> Placa: <%=veiculo.getPlaca()%> | Modelo: <%=veiculo.getModelo()%> </td>
                    </tr>        
<%
                                                    ArrayList<Usuario> lis = usuarioDB.listar();
                                                    for(Usuario usuari : lis) {
                                                        if (atendimento.getUsuario().getPessoa().getId() == usuari.getPessoa().getId()) {                                                
%>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Usuario</td>
                        <td style="text-align: center; font-weight: bold;">Responsável pelo Atendimento</td>    
                        <td style="text-align: center; font-weight: bold;">Observação</td>
                        <td style="text-align: center; font-weight: bold;">Marca e Cor do Veículo</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;"> <%=usuari.getLogin()%> </td>
                        
<%
                                                        }
                                                    }
                                                    ArrayList<Funcionario> li = funcionarioDB.listar();
                                                    for(Funcionario funcionario : li) {
                                                        if (atendimento.getFuncionario().getPessoa().getId() == funcionario.getPessoa().getId()) {  
%>
                        
                        <td style="text-align: center;"> <%=funcionario.getApelido()%> </td>
                        
<%
                                                        }
                                                    }
%>
                        
                        <td style="text-align: center;"> <%=atendimento.getObservacao()%> </td>
                        
                        <td style="text-align: center;"> Marca: <%=veiculo.getMarca()%> | Cor: <%=veiculo.getCor()%> </td>

<%
                                                        }
                                                    }
%>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Forma de Pagamento</td>
                        <td style="text-align: center; font-weight: bold;">Valor Total</td>    
                        <td style="text-align: center; font-weight: bold;">Situação do Pagamento</td>
                        <td style="text-align: center; font-weight: bold;">Concluir Atendimento</td>
                    </tr>
                    
                    <tr>
<%
                                                    DecimalFormat formato = new DecimalFormat("0.00");
                                                    ArrayList<FormaDePagamento> descricao = formaDePagamentoBD.listar();
                                                    for(FormaDePagamento formaDePagamento : descricao) {
                                                        if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaDePagamento.getServicoPreco().getId()) {                                                
%>
                        
                        <td style="text-align: center;"> <%=formaDePagamento.getServicoPreco().getNome()%> </td>
                        
<%
                                                        }
                                                    }
                                                    Double valorTotal = atendimento.getValorTotal();
                                                    String valorTotalFormatado = formato.format(valorTotal);
%>
                        
                        <td style="text-align: center;"> <%=valorTotalFormatado%> </td>
                        
                        <td style="text-align: center;">
                            <script src="js/PagoEmAberto.js"></script>
                            <% if (atendimento.isStatusPagamento()) { %>

                                <!-- Se o cliente estiver em aberto, status true, deverá pagar e ficar false -->
                                <form action="pagar_atendimento.do" method="post">
                                    <input type="hidden" name="id" value="<%=atendimento.getId()%>">

                                    <!-- Mostra a imagem de status ativo -->
                                    <button id="botao-alterar-tema" class="botao-padrao" type="submit" value="desativar">
                                        em aberto
                                    </button>
                                </form>

                            <% } else { %>

                                <!-- Se o cliente estiver pago, status false, deverá ficar em aberto e ficar true -->
                                <form action="nao_pagar_atendimento.do" method="post">
                                    <input type="hidden" name="id" value="<%=atendimento.getId()%>">

                                    <!-- Mostra a imagem de status desativado -->
                                    <button id="botao-alterar-tema" class="botao-padrao" type="submit" value="ativar">
                                        pago
                                    </button>
                                </form>
                            <% } %>
                        </td>
                        
                        <td style="text-align: center;">
                            <% if (atendimento.isStatusAtendimento()) { %>

                                <!-- Já que está ativado permite desativar o atendimento -->
                                <form action="DesativarAtendimento" method="post">
                                    <input type="hidden" name="id" value="<%=atendimento.getId()%>">
                                    <input type="hidden" name="statusAtendimento" value="false">
                                    <input type="hidden" name="statusPagamento" value="<%=atendimento.isStatusPagamento()%>">

                                    <button type="submit" class="botao-padrao">
                                        concluir
                                    </button>
                                </form>
                            <% } %>
                        </td>
                    </tr> 
                </table>
<%
                                            }
                                        }
                                }
                            }
                                usuarioDB.desconectar();
                                atendimentoDB.desconectar();
                                funcionarioDB.desconectar();
                                veiculoDB.desconectar();
                                clienteDB.desconectar();
                                precoDB.desconectar();
                                formaDePagamentoBD.desconectar();

                            } catch (Exception erro) {
                                out.print(erro);
                            }
%>
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
