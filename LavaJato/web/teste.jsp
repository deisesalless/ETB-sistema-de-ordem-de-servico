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
        <title>Teste de listar Perfil</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/teste.css">
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
                
                <div class="conteudo">
                    <h3> Cadastrar Atendimento </h3>
                    
                    <form>
                        
                        <div class="esquerda">
                            
                            <% // Mostra o usuario que está logado
                                try{
                                    usuario = (Usuario) session.getAttribute("usuario");
                                    usuario.getPessoa().getId();
                                }catch(Exception e){
                                    out.print(e);
                                }

                            %>
                            
                            <input type="hidden" name="id_usuario" value="<%=usuario.getPessoa().getId()%>"> 

                            <%
                                Date hoje = new Date();
                                DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                String dataCadastro = dataFormatada.format(hoje);
                            %>
                            <input type="hidden" name="dataCadastro" value="<%=dataCadastro%>">                     
                        <%
                            try {
                                int id = Integer.parseInt(request.getParameter("id"));

                                ClienteDAO clienteBD = new ClienteDAO();
                                clienteBD.conectar();
                                Cliente cliente = clienteBD.pesquisarPorId(id);
                                if (cliente.getPessoa().getId() > 0) {            
                        %>
                            <input type="hidden" name="id_cliente" value="<%=cliente.getPessoa().getId()%>">
                            
                            <label>Cliente:</label>
                            <%=cliente.getPessoa().getNomeCompleto()%>
                            <input type="hidden" name="nomeCompleto" value="<%=cliente.getPessoa().getNomeCompleto()%>"> <br>
                            
                            <label>Telefone:</label>
                            <%=cliente.getTelefone()%>
                            <input type="hidden" name="telefone" value="<%=cliente.getTelefone()%>"> <br>
                        </div>
                        
                        <div class="esquerda">
                            <label>Veiculo:</label> <br>

                        <% 
                                    try {
                                        VeiculoDAO veiculoDB = new VeiculoDAO();
                                        List<Veiculo> list;
                                        veiculoDB.conectar();
                                        list = veiculoDB.listar();
                                        for(Veiculo veic:list) {
                                            if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()) {
                        %>

                            <input type="checkbox" name="id_veiculo" value="<%=veic.getId()%>">
                            <label> <%=veic.getPlaca()%> | <%=veic.getMarca()%> | <%=veic.getCor()%> | <%=veic.getModelo()%> </label> <br>
                        
                        <%
                                            }
                                        }
                                        veiculoDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                        %>
                        </div>    
                        <%      }
                                clienteBD.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                        
                        <div class="esquerda">
                            <label>Escolher serviços: </label> <br><br>
                        <%
                            try {
                                    TabelaPrecoDAO precoDB = new TabelaPrecoDAO();
                                    precoDB.conectar();
                                    ArrayList<TabelaPreco> lista;
                                    lista = precoDB.listar();
                                    for(TabelaPreco tabelaPreco:lista) {
                                        if (tabelaPreco.isStatus()){
                                            
                                        
                                    
                        %>

                            <label> <%=tabelaPreco.getNome()%> </label> <br>
                            
                            <input type="checkbox" name="precoVeiculoGrande" value="<%=tabelaPreco.getPrecoVeiculoGrande()%>">
                            <label>Grande</label>
                            
                            <input type="checkbox" name="precoVeiculoMédio" value="<%=tabelaPreco.getPrecoVeiculoMedio()%>">
                            <label>Médio</label>
                            
                            <input type="checkbox" name="precoVeiculoPequeno" value="<%=tabelaPreco.getPrecoVeiculoPequeno()%>">
                            <label>Pequeno</label> <br><br>
                        
                        <%
                                        }
                                    }
                                    precoDB.desconectar();
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                        
                        %>
                        </div>
                        
                        <div class="esquerda">
                            <label> Observação: </label> <br>
                            <textarea class="observacao" placeholder="Digite aqui as observações do veículo/cliente"></textarea>
                        </div>
                        
                        <div class="esquerda">
                            <label>Escolher responsável pelo atendimento:</label> <br>
                            <label>Colaborador(a):</label>
                            
                            <select name="id_funcionario" class="adicional">
                                <option value="" selected>Escolha um nome</option>
                                
                        <%
                            try {
                                FuncionarioDAO funcionarioDB = new FuncionarioDAO();
                                funcionarioDB.conectar();
                                ArrayList<Funcionario> lista = funcionarioDB.listar();
                                for(Funcionario funcionario : lista) {
                                    if (funcionario.getPessoa().isStatus() && (funcionario.getPerfil().getId() == 9)) {
                        %>
                        
                                <option value="<%=funcionario.getPessoa().getId()%>"><%=funcionario.getApelido()%></option>
                                                    
                        <%        
                                    }
                                }
                                funcionarioDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                            </select>
                        </div>
                            
                        <div class="esquerda">
                            <label> Valor Adicional: </label> <br>
                            <input class="adicional" type="text" name="precoAdicional" placeholder="Digite somente o valor, exemplo: 15,00" size="31">
                        </div>
                            
                        <div class="esquerda">
                            <label> Valor do Desconto: </label> <br>
                            <input class="adicional" type="text" name="desconto" placeholder="Digite somente o valor, exemplo: 15,00" size="31">
                        </div>
                            
                        <div class="esquerda">
                            <label>Forma de Pagamento:</label> <br>
                        <%
                            try {
                                FormaDePagamentoDAO tipoPagamento = new FormaDePagamentoDAO();
                                tipoPagamento.conectar();
                                ArrayList<FormaDePagamento> lista = tipoPagamento.listar();
                                for(FormaDePagamento pagamento : lista) {
                                    if (pagamento.getServicoPreco().isStatus()) {
                        %>
                            <label>
                                <input type="radio" name="id_tipo_pagamento" value="<%=pagamento.getServicoPreco().getId()%>" checked>
                                <%=pagamento.getServicoPreco().getNome()%>
                            </label>
                        <%
                                    }
                                }
                                tipoPagamento.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                        </div>
                            
                        <div class="esquerda">
                            <label>Situação do Pagamento:</label> <br>
                            
                            <label>
                                <input type="radio" name="statusPagamento" value="pago"> Pago
                            </label>
                            
                            <label>
                                <input type="radio" name="statusPagamento" value="emAberto" checked> Em aberto
                            </label>
                        </div>
                        
                        <div align="center">
                            <button>Salvar</button>
                        </div>
                    </form>
                </div>

            </div>       
        </div>
    </body>
</html>