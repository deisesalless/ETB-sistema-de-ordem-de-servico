<%@page import="entidade.Atendimento"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="entidade.Funcionario"%>
<%@page import="persistencia.FuncionarioDAO"%>
<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Veiculo"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Atendimento</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/cadastrar-atendimento.css">
        <script src="javascript/On&Off.js"></script>
        <script src="javascript/CarrinhoDeServicos.js"></script>
        <script src="javascript/ValorAdicional.js"></script>
        <script src="javascript/ValorDesconto.js"></script>
        <script src="javascript/processar-pop-up.js"></script>
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
                    <h3> Cadastrar Atendimento </h3>                                        
                        
                    <div class="conteiner">
                        <div class="lado1">

                            <%

                                try {

                                        int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));

                                        VeiculoDAO veiculoDB = new VeiculoDAO();
                                        ClienteDAO  clienteDB = new ClienteDAO();
                                        TabelaPrecoDAO precoDB = new TabelaPrecoDAO();
                                        FormaDePagamentoDAO tipoPagamento = new FormaDePagamentoDAO();
                                        FuncionarioDAO funcionarioDB = new FuncionarioDAO();

                                        funcionarioDB.conectar();
                                        veiculoDB.conectar();
                                        clienteDB.conectar();
                                        precoDB.conectar();
                                        tipoPagamento.conectar();

                                        Veiculo veiculo = veiculoDB.pesquisarPorId(id_veiculo);
                                        Cliente cliente = clienteDB.pesquisarPorId(veiculo.getCliente().getPessoa().getId());

                                        ArrayList<Funcionario> lista = funcionarioDB.listar();
                                        ArrayList<FormaDePagamento> list = tipoPagamento.listar();
                                        ArrayList<TabelaPreco> lis = precoDB.listar();

                            %>

                            <%
                                        if(veiculo.getId() > 0 && (veiculo.getCliente().getPessoa().getId() == cliente.getPessoa().getId())) {
                            %>

                            <label> ID Cliente: </label>
                            <%=cliente.getPessoa().getId()%> <br>
                            <br>

                            <label> Cliente: </label>
                            <%=cliente.getPessoa().getNomeCompleto()%> <br>
                            <br>

                            <label> Telefone: </label>
                            <%=cliente.getTelefone()%> <br>
                            <br>

                            <label> Informações do Veiculo: </label> <br>
                            <label> ID Veiculo: </label> <%=veiculo.getId()%> |
                            
                            <label> ID Cliente: </label> <%=veiculo.getCliente().getPessoa().getId()%> |
                            <label> Placa: </label> <%=veiculo.getPlaca()%> |
                            <label> Cor: </label> <%=veiculo.getCor()%> |
                            <label> Marca: </label> <%=veiculo.getMarca()%> |
                            <label> Modelo: </label> <%=veiculo.getModelo()%>
                            
                        </div>
                            <%    
                                        }
                            %>
                        <div class="lado2">
                            <label> Observação: </label> <br>
                            <textarea class="observacao" id="observacaoInput" placeholder="Digite aqui as observações do veículo/cliente"></textarea>
                        </div>
                    </div>
                        
                    <div class="conteiner-box">

                        <!-- Valor Adicional -->
                        <div class="lado1"> 
                            <label> Valor Adicional: </label>
                            <button onclick="adicionarValorAdicional()"> adicionar </button> <br>
                            <input class="adicional" type="text" id="valorAdicionalInput" placeholder="Digite somente o valor, exemplo: 15,00" size="35">

                        </div>

                        <!-- Valor Desconto -->
                        <div class="lado2">
                            <label> Valor de Desconto: </label>
                            <button onclick="adicionarValorDesconto()"> adicionar </button> <br>
                            <input class="adicional" type="text" id="valorDescontoInput" placeholder="Digite somente o valor, exemplo: -15,00" size="35">
                        </div>
                    </div>
                        
                    <div class="conteiner">
                        <div class="tabela-precos" class="lado1">

                            <span style="display: block; text-align: center;"> Tabela de Serviços </span>
                            <br>

                            <%
                                for(TabelaPreco tabelaPreco:lis) {
                                    if (tabelaPreco.isStatus()) {
                            %>


                            <div>
                                <span> <%=tabelaPreco.getId()%> - <%=tabelaPreco.getNome()%> : </span> <br>

                                <button onclick="adicionarServico('<%= tabelaPreco.getId() %>', '<%= tabelaPreco.getNome() %>', '<%= tabelaPreco.getPrecoVeiculoPequeno() %>')">
                                    Pequeno
                                </button>

                                <button onclick="adicionarServico('<%= tabelaPreco.getId() %>', '<%= tabelaPreco.getNome() %>', '<%= tabelaPreco.getPrecoVeiculoMedio() %>')">
                                    Médio
                                </button>

                                <button onclick="adicionarServico('<%= tabelaPreco.getId() %>', '<%= tabelaPreco.getNome() %>', '<%= tabelaPreco.getPrecoVeiculoGrande() %>')">
                                    Grande
                                </button>

                                <br><br>
                            </div>

                            <%
                                    }
                                }
                            %>

                        </div>

                        <div class="tabela-carrinho" class="lado2">

                            <span style="display: block; text-align: center;"> Serviços Selecionados </span>
                            <br>

                            <table id="tabelaCarrinho" width="700px" border="1">
                                
                                <tr id="valorTotalCarrinho">
                                    <td></td><td></td>
                                    <td align="right"> Valor total: R$ </td>
                                    
                                    <!-- Aqui mostra o valor total atualizado e repassa para o input -->
                                    <td align="right" id="valorTotal"> 0,00 </td>
                                </tr>  
                                
                                <tr bgcolor="#d3d3d3" align="center">
                                    <td width="150px"> Desvincular Serviço </td>
                                    <td> ID </td>
                                    <td> SERVIÇO </td>
                                    <td align="right" class="valorUnitario"> VALOR UND </td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                            
                    <div class="botao-finalizar-cadastro">
                        <button id="mostrar-pop-up"> Finalizar Cadastro </button>
                    </div>
                </div>
                        
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Confirmação do Pedido de Atendimento</h3>
                        <script language="javascript" >
                            function validaForm(){
                                formulario = document.form_cadastrar_atendimento;
                                if(formulario.id_funcionario.value===""){
                                    alert("O campo RESPONSÁVEL PELO ATENDIMENTO deve ser preenchido!");
                                    formulario.id_funcionario.focus();
                                    return false;
                                }
                                return true;
                            }
                        </script>
                            <form name="form_cadastrar_atendimento" action="cadastrar_atendimento.do" method="post" onsubmit="return validaForm();">
                                
                            <%
                                Date hoje = new Date();
                                DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                String dataCadastro = dataFormatada.format(hoje);
                            %>                                
                                <label>Data:</label>
                                <%=dataCadastro%>
                                <input type="hidden" name="data" value="<%=dataCadastro%>">
                                <br>
                                
                                <% // Mostra o usuario que está logado
                                    try{
                                        usuario = (Usuario) session.getAttribute("usuario");
                                        usuario.getPessoa().getId();
                                    }catch(Exception erro){
                                        out.print(erro);
                                    }
                                %>                                
                                <label>Usuario:</label>
                                <%=usuario.getLogin()%>
                                <input type="hidden" name="id_usuario" value="<%=usuario.getPessoa().getId()%>">
                                <br>
                                
                                <label>Cliente:</label>
                                <%=cliente.getPessoa().getNomeCompleto()%>
                                <input type="hidden" name="id_cliente" value="<%=cliente.getPessoa().getId()%>">
                                <br>
                                
                                <label>Telefone:</label>
                                <%=cliente.getTelefone()%>
                                <br>

                                <label>Informações do Veículo:</label> <br>
                                <%=veiculo.getId()%> | <%=veiculo.getPlaca()%> | <%=veiculo.getModelo()%> | <%=veiculo.getMarca()%> | <%=veiculo.getCor()%>
                                <input type="hidden" name="id_veiculo" value="<%=veiculo.getId()%>">
                                <br>
                                
                                <!-- Mostrar as observações digitadas -->
                                <label>Observações:</label> <br>
                                <span id="observacoesPopUp"></span>
                                
                                <br>
                                <!-- Mostrar o valor total -->
                                <label>Valor Total:</label> <br>
                                R$ 
                                <span id="valorTotalPopUp"></span>
                                
                                <br>
                                <label> Forma de Pagamento: </label> <br>
                                <%
                                    for(FormaDePagamento pagamento : list) {
                                        if (pagamento.getServicoPreco().isStatus()) {

                                %>

                                <label>
                                    <input type="radio" name="id_forma_pagamento" value="<%=pagamento.getServicoPreco().getId()%>" checked>
                                    <%=pagamento.getServicoPreco().getNome()%>
                                </label>

                                <%
                                        }
                                    }
                                %>                                
                            
                            <br>
                            
                            <label> Situação do Pagamento: </label> <br>
                            <label>
                                <input type="radio" name="statusPagamento" value="true" checked> Em aberto
                            </label>

                            <label>
                                <input type="radio" name="statusPagamento" value="false"> Pago 
                            </label>
                            
                            <br>
                            
                            <label> Responsável pelo Atendimento </label> <br>
                            <label> Colaborador(a): </label>
                            <select name="id_funcionario" class="adicional">
                                <option value="" selected>Escolha um nome</option>
                            <%
                                for(Funcionario funcionario : lista) {
                                    if (funcionario.getPessoa().isStatus() && (funcionario.getPerfil().getId_perfil()== 22)) {
                            %>

                                    <option value="<%=funcionario.getPessoa().getId()%>"><%=funcionario.getApelido()%></option>    

                            <%
                                    }
                                }
                            %>
                            </select>

                            <div class="botao-salvar-formulario">
                                <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                            </div>
                            </form>
                                <%
                                            funcionarioDB.desconectar();
                                            veiculoDB.desconectar();
                                            clienteDB.desconectar();
                                            precoDB.desconectar();
                                            tipoPagamento.desconectar();
                                            
                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                %>
                        </div>
                    <script src="javascript/MostrarPopUpAtendimento.js"></script>
                </div>

            </div>       
        </div>
    </body>
</html>