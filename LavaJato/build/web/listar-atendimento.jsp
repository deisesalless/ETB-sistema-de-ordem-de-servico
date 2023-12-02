<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="entidade.FormaDePagamento"%>
<%@page import="entidade.Funcionario"%>
<%@page import="persistencia.FuncionarioDAO"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="entidade.Atendimento"%>
<%@page import="persistencia.AtendimentoDAO"%>
<%@page import="DataUtility.DataUtility"%>
<%@page import="entidade.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar cliente e veiculo</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/menu.css">
        <link rel="stylesheet" type="text/css" href="estilo/cliente-veiculo.css">
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
                <div class="conteudo">
                    <h3>
                        Lista de Atendimentos Em Andamento

                    </h3>
                    <div class="sanfona">
                        <div class="item">
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
                            %>
                            
                            
                            
                            <%
                                        List<Atendimento> lista = atendimentoDB.listar();
                                        for(Atendimento atendimento : lista) {
                                            if (atendimento.isStatusAtendimento() == true){
                                                
                            %>
                            
                            <%
                                        ArrayList<Cliente> list = clienteDB.listar();
                                        for(Cliente cliente : list) {
                                            if (atendimento.getCliente().getPessoa().getId() == cliente.getPessoa().getId()){
                                                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                                String dataCadastro = dataFormatada.format(atendimento.getData());
                            %>
                            <div class="nome-cliente">
                                Data da Abertura: <%=dataCadastro%> | Id: <%=atendimento.getId()%> | Nome do Cliente: <%=cliente.getPessoa().getNomeCompleto()%>
                            </div>
                            <div class="veiculo-cliente">

                                <table width="1200" border="1">
                            <%
                                        ArrayList<Usuario> lis = usuarioDB.listar();
                                        for(Usuario usuari : lis) {
                                            if (atendimento.getUsuario().getPessoa().getId() == usuari.getPessoa().getId()){                                                
                            %>
                                    
                                    <tr bgcolor="#d3d3d3">
                                        <td>Usuario</td>
                                        <td>Responsável pelo Serviço</td> 
                                    </tr>
                                    
                                    <tr>
                                        <td><%=usuari.getLogin()%></td>
                                        
                            <%
                                            }
                                        }
                            %>
                                        
                            <%
                                        ArrayList<Funcionario> li = funcionarioDB.listar();
                                        for(Funcionario funcionario : li) {
                                            if (atendimento.getFuncionario().getPessoa().getId() == funcionario.getPessoa().getId()){                                                
                            %>
                                        
                                        <td><%=funcionario.getApelido()%></td>
                            
                            <%
                                            }
                                        }
                            %>
                                    </tr>
                                    <tr bgcolor="#d3d3d3">
                                        <td>Cliente</td>
                                        <td>Telefone</td>
                                    </tr>
                                    
                                    <tr>
                                        <td> <%=cliente.getPessoa().getId()%> | <%=cliente.getPessoa().getNomeCompleto()%></td>
                                        <td> <%=cliente.getTelefone()%> </td>
                                    </tr>
                                    
                                    <tr bgcolor="#d3d3d3">
                                        <td>Informações do Veiculo</td>
                                        <td>Observações</td>
                                    </tr>

                            <%
                                        ArrayList<Veiculo> l = veiculoDB.listar();
                                        for(Veiculo veiculo : l) {
                                            if (atendimento.getVeiculo().getId() == veiculo.getId()){                                                
                            %>
                            
                                    <tr>
                                        <td> 
                                            ID: <%=veiculo.getId()%> | Placa: <%=veiculo.getPlaca()%> | Modelo: <%=veiculo.getModelo()%> |
                                            Marca: <%=veiculo.getMarca()%> | Cor: <%=veiculo.getCor()%>
                                        </td>
                                        
                            <%
                                            }
                                        }
                            %>
                                        
                                        <td> <%=atendimento.getObservacao()%> </td>
                                    </tr>
                                    
                                    <tr bgcolor="#d3d3d3">
                                        <td>Forma de Pagamento</td>
                                        <td>Valor Total do Serviço</td>                                       
                                    </tr>
                                    <tr>
                                        
                            <%
                                        DecimalFormat formato = new DecimalFormat("0.00");
                                        ArrayList<FormaDePagamento> descricao = formaDePagamentoBD.listar();
                                        for(FormaDePagamento formaDePagamento : descricao) {
                                            if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaDePagamento.getServicoPreco().getId()) {                                                
                            %>
 
                                            <td> <%=formaDePagamento.getServicoPreco().getNome()%> </td>
                                            
                            <%
                                            }
                                        }
                            %>

                            
                                <%
                                    Double valorTotal = atendimento.getValorTotal();
                                    String valorTotalFormatado = formato.format(valorTotal);
                                %>
                                        
                                            <td> <%=valorTotalFormatado%> </td>
                                    </tr>
                                    <tr bgcolor="#d3d3d3">
                                        <td>Situação do Pagamento</td>
                                        <td>Desativar Atendimento</td>                                       
                                    </tr>
                                    
                                    <tr>        
                                        <td>
                                            <script src="javascript/PagoEmAberto.js"></script>
                                        
                                        <% if (atendimento.isStatusPagamento()) { %>

                                            <!-- Se o cliente estiver em aberto, status true, deverá pagar e ficar false -->
                                            <form action="pagar_atendimento.do" method="post">
                                                <input type="hidden" name="id" value="<%=atendimento.getId()%>">

                                                <!-- Mostra a imagem de status ativo -->
                                                <button id="botao-alterar-tema" type="submit" value="desativar">
                                                    Em Aberto
                                                </button>
                                            </form>

                                        <% } else { %>

                                            <!-- Se o cliente estiver pago, status false, deverá ficar em aberto e ficar true -->
                                            <form action="nao_pagar_atendimento.do" method="post">
                                                <input type="hidden" name="id" value="<%=atendimento.getId()%>">

                                                <!-- Mostra a imagem de status desativado -->
                                                <button id="botao-alterar-tema" type="submit" value="ativar">
                                                    Pago
                                                </button>
                                            </form>
                                        <% } %>
                                        </td>
                                        
                                        <td>
                                            <% if (atendimento.isStatusAtendimento()) { %>

                                                <!-- Já que está ativado permite desativar o atendimento -->
                                                <form action="DesativarAtendimento" method="post">
                                                    <input type="hidden" name="id" value="<%=atendimento.getId()%>">
                                                    <input type="hidden" name="statusAtendimento" value="false">
                                                    <input type="hidden" name="statusPagamento" value="<%=atendimento.isStatusPagamento()%>">

                                                    <button type="submit">
                                                        Concluir Atendimento 
                                                    </button>
                                                </form>
                                            <% } %>    
                                        </td>
                                    </tr>
                                </table>

                            <%
                                            }
                                        }
                            %>
                            </div>
                            <%
                                            }
                                        }
                            %>
                            
                                <%          
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
                        
                        <script>
                            const accordion = document.getElementsByClassName('item');

                            for (i = 0; i < accordion.length; i++){
                                accordion[i].addEventListener('click', function() {
                                    this.classList.toggle('ativo')
                                })
                            }
                        </script>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>