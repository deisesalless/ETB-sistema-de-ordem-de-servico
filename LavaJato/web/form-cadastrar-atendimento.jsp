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
        <link rel="stylesheet" type="text/css" href="estilo/cadastrar-atendimento.css">
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
                    <script language="javascript" >
                        function validaForm(){
                            formulario = document.form_cadastrar_atendimento;
                            if(formulario.id_funcionario.value===""){
                                alert("O campo RESPONSÁVEL PELO ATENDIMENTO precisa estar preenchido!");
                                formulario.id_funcionario.focus();
                                return false;
                            }
                            return true;
                        }
                    </script>
                    
                    <form name="form_cadastrar_atendimento" action="cadastrar_atendimento.do" method="post" onsubmit="return validaForm();">
                        
                        <div class="conteiner-box">
                            
                            <div class="box">
                                <label> Situação do Atendimento: </label>
                                <label>
                                    <input type="hidden" name="status_atendimento" value="true">
                                    EM ANDAMENTO
                                </label>
                            </div>

                            <div class="box">
                                <label> Usuário: </label>
                                <% // Mostra o usuario que está logado
                                    try{
                                        usuario = (Usuario) session.getAttribute("usuario");
                                        usuario.getPessoa().getId();
                                    }catch(Exception erro){
                                        out.print(erro);
                                    }
                                %>
                                <%=usuario.getLogin()%>
                                <input type="hidden" name="id_usuario" value="<%=usuario.getPessoa().getId()%>"> 
                            </div>
                            
                            <div class="box">
                                <label> Data: </label>
                                <%
                                    Date hoje = new Date();
                                    DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                    String dataCadastro = dataFormatada.format(hoje);
                                %>
                                <%=dataCadastro%>
                                <input type="hidden" name="data" value="<%=dataCadastro%>">     
                            </div>
                        </div>
                        
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

                                            if(veiculo.getId() > 0 && (veiculo.getCliente().getPessoa().getId() == cliente.getPessoa().getId())) {
                                %>

                                <label> ID Cliente: </label>
                                <%=cliente.getPessoa().getId()%> <br>
                                <input type="hidden" name="id_cliente" value="<%=cliente.getPessoa().getId()%>"> <br>

                                <label> Cliente: </label>
                                <%=cliente.getPessoa().getNomeCompleto()%> <br>
                                <input type="hidden" name="nomeCompleto" value="<%=cliente.getPessoa().getNomeCompleto()%>"> <br>

                                <label> Telefone: </label>
                                <%=cliente.getTelefone()%> <br>
                                <input type="hidden" name="telefone" value="<%=cliente.getTelefone()%>"> <br>

                                <label> Informações do Veiculo: </label> <br>
                                <label> ID Veiculo: </label> <%=veiculo.getId()%> |
                                <label> ID Cliente: </label> <%=veiculo.getCliente().getPessoa().getId()%> |
                                <label> Placa: </label> <%=veiculo.getPlaca()%> |
                                <label> Cor: </label> <%=veiculo.getCor()%> |
                                <label> Marca: </label> <%=veiculo.getMarca()%> |
                                <label> Modelo: </label> <%=veiculo.getModelo()%>
                                <input type="hidden" name="id_veiculo" value="<%=veiculo.getId()%>">
                            </div>
                                <%    
                                            }
                                %>
                            <div class="lado2">
                                <label> Observação: </label> <br>
                                <textarea class="observacao" name="observacao" placeholder="Digite aqui as observações do veículo/cliente"></textarea>
                            </div>
                        </div>
                        
                        <div class="conteiner-box">
                            <div class="box"> 
                                <label> Valor Adicional: </label>
                                <button> adicionar </button> <br>
                                <input class="adicional" type="text" name="precoAdicional" placeholder="Digite somente o valor, exemplo: 15,00" size="31">
                            </div>

                            <div class="box">
                                <label> Valor do Desconto: </label>
                                <button> adicionar </button> <br>
                                <input class="adicional" type="text" name="desconto" placeholder="Digite somente o valor, exemplo: 15,00" size="31">
                            </div>
                            
                            <div class="box">
                                <label> Responsável pelo Atendimento </label> <br>
                                <label> Colaborador(a): </label>
                                <select name="id_funcionario" class="adicional">
                                    <option value="" selected>Escolha um nome</option>
                                <%
                                    ArrayList<Funcionario> lista = funcionarioDB.listar();
                                    for(Funcionario funcionario : lista) {
                                        if (funcionario.getPessoa().isStatus() && (funcionario.getPerfil().getId() == 22)) {
                                %>
                                
                                        <option value="<%=funcionario.getPessoa().getId()%>"><%=funcionario.getApelido()%></option>    
                                
                                <%
                                        }
                                    }
                                %>
                                
                                </select>
                            </div>
                        </div>
                        
                        <div class="conteiner">
                            <div class="titulo-tabela1">
                                <label> Tabela de Preços e Serviços </label>
                            </div>
                            
                            <div class="lado2" class="titulo-tabela2">
                                <label> Carrinho de Serviços </label>
                                <button> adicionar </button>
                            </div>
                        </div>
                        
                        <div class="conteiner">
                            <div class="tabela-precos" class="lado1">

                                <%
                                            ArrayList<TabelaPreco> lis = precoDB.listar();
                                            for(TabelaPreco tabelaPreco:lis) {
                                                if (tabelaPreco.isStatus()) {
                                %>
                            
                                <div>
                                    <div>
                                        <label> <%=tabelaPreco.getId()%> - <%=tabelaPreco.getNome()%> </label> <br>

                                        <input type="radio" name="precoServico" value="<%=tabelaPreco.getPrecoVeiculoPequeno()%>" select>
                                        <label>Pequeno</label>

                                        <input type="radio" name="precoServico" value="<%=tabelaPreco.getPrecoVeiculoMedio()%>">
                                        <label>Médio</label>


                                        <input type="radio" name="precoServico" value="<%=tabelaPreco.getPrecoVeiculoGrande()%>">
                                        <label>Grande</label> <br><br>
                                    </div>
                                </div>
                            
                                <%
                                                }
                                            }
                                %>

                            </div>
                                
                            <div class="lado2">
                                <table width="700px" border="1">
                                    <tr>
                                        <td> Remover </td>
                                        <td> ID </td>
                                        <td> SERVIÇO </td>
                                        <td> VALOR </td>
                                    </tr>
                                    <tr>
                                        <td align="center"> -- </td>
                                        <td align="center"> -- </td>
                                        <td align="center"> -- </td>
                                        <td align="center"> -- </td>
                                    </tr>
                                </table>
                                
                                <br>
                                
                                <table width="700px" border="1">
                                    <tr>
                                        <td> Valor total: </td>
                                        <td> R$ 10,00 </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                                
                        <div class="conteiner">
                            <div class="lado1">
                                <label> Forma de Pagamento: </label> <br>
                                <%
                                            ArrayList<FormaDePagamento> list = tipoPagamento.listar();
                                            for(FormaDePagamento pagamento : list) {
                                                if (pagamento.getServicoPreco().isStatus()) {
                                                
                                %>
                                
                                <label>
                                    <input type="radio" name="id_tipo_pagamento" value="<%=pagamento.getServicoPreco().getId()%>" checked>
                                    <%=pagamento.getServicoPreco().getNome()%>
                                </label>
                                
                                <%
                                                }
                                            }
                                %>
                            </div>
                            <div class="lado2">
                                <label> Situação do Pagamento: </label> <br>
                                
                                <label>
                                    <input type="radio" name="status_pagamento" value="true" checked>
                                    Em aberto
                                </label>
                                <label>
                                    <input type="radio" name="status_pagamento" value="false">
                                    Pago
                                </label>
                            </div>
                        </div>
                            
                        <div class="botao-salvar">
                            <button type="submit"> Salvar </button>
                        </div>
                        
                        <%
                                            funcionarioDB.desconectar();
                                            tipoPagamento.desconectar();
                                            precoDB.desconectar();
                                            clienteDB.desconectar();    
                                            veiculoDB.desconectar();

                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                %>
                    </form>
                </div>

            </div>       
        </div>
    </body>
</html>