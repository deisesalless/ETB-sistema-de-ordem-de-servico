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
        <title>Teste de listar Perfil</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/menu.css">
        <link rel="stylesheet" type="text/css" href="estilo/cliente-veiculo.css">
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
                <div class="conteudo">
                    <h3>
                        Lista de Clientes e Veiculos
                        <button id="mostrar-pop-up">+ Novo</button>
                    </h3>
                    <div class="sanfona">
                        <%
                            try {
                                ClienteDAO clienteDB = new ClienteDAO();
                                ArrayList<Cliente> lista;
                                clienteDB.conectar();
                                lista = clienteDB.listar();
                                for(Cliente cliente:lista) {
                       %>
                        <div class="item">
                            <div class="nome-cliente">
                                <%=cliente.getPessoa().getId()%> - <%=cliente.getPessoa().getNomeCompleto()%>
                            </div>
                            <%
                                try {
                                    VeiculoDAO veiculoDB = new VeiculoDAO();
                                    List<Veiculo> list;
                                    veiculoDB.conectar();
                                    list = veiculoDB.listar();
                                    veiculoDB.desconectar();
                                    for(Veiculo veic:list) {
                                        if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()){
                            %>
                            <div class="veiculo-cliente">
                                <table width="1200" border="1">
                                    <tr bgcolor="#d3d3d3">
                                        <td>ID cliente</td>
                                        <td>Nome Completo</td>
                                        <td>Telefone</td>
                                        <td>Data Cadastro</td>
                                        <td>Novo veiculo</td>
                                        <td>Alterar</td>
                                    </tr>
                                    <tr>
                                        <td><%=cliente.getPessoa().getId()%></td>
                                        <td><%=cliente.getPessoa().getNomeCompleto()%></td>
                                        <td><%=cliente.getTelefone()%></td>
                                        <td><%=DataUtility.formatarDataComPadrao(cliente.getPessoa().getDataCadastro())%></td>
                                        <td align="center"><button> adicionar </button></td>
                                        <td align="center"><button> alterar </button></td>
                                    </tr>
                                    <tr bgcolor="#d3d3d3">
                                        <td>ID cliente</td>
                                        <td>Placa</td>
                                        <td>Cor</td>
                                        <td>Marca</td>
                                        <td>Modelo</td>
                                        <td>Alterar</td>
                                    </tr>
                                    <tr>
                                        <td><%=veic.getCliente().getPessoa().getId()%></td>
                                        <td><%=veic.getPlaca()%></td>
                                        <td><%=veic.getCor()%></td>
                                        <td><%=veic.getMarca()%></td>
                                        <td><%=veic.getModelo()%></td>
                                        <td align="center"><button> alterar </button></td>
                                    </tr>
                                </table>
                                <%
                                            }
                                        }
                                        veiculoDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </div>
                        <%
                                }
                                clienteDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                        </div>
                        <script>
                            let accordion = document.querySelector(".sanfona");
                            let accordionItems = accordion.querySelectorAll(".item");

                            for(let i=0;i<accordionItems.length;i++){

                              let questionItem = accordionItems[i].querySelector(".nome-cliente");

                              questionItem.addEventListener("click",function(){

                                if(accordionItems[i].classList.contains("ativo")){

                                  accordionItems[i].classList.remove("ativo");

                                } else {

                                  try {
                                    accordion.querySelector(".ativo").classList.remove("ativo");

                                  } catch(msg){}

                                  accordionItems[i].classList.add("ativo");
                                }
                              });
                            }
                        </script>
                    </div>
                </div>
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Cliente & Veiculo</h3>
                            <script>
                                function validaForm(){
                                    formulario = document.form_cadastrar_cliente_veiculo;
                                    if(formulario.nomeCompleto.value===""){
                                        alert("O campo Nome deve ser preenchido!");
                                        formulario.nomeCompleto.focus();
                                        return false;
                                    }
                                    if(formulario.telefone.value===""){
                                        alert("O campo Telefone deve ser preenchido!");
                                        formulario.telefone.focus();
                                        return false;
                                    }
                                    if(formulario.dataCadastro.value===""){
                                        alert("O campo Data deve ser preenchido!");
                                        formulario.dataCadastro.focus();
                                        return false;
                                    }
                                    if(formulario.placa.value===""){
                                        alert("O campo Placa deve ser preenchido!");
                                        formulario.placa.focus();
                                        return false;
                                    }
                                    if(formulario.cor.value===""){
                                        alert("O campo Cor deve ser preenchido!");
                                        formulario.cor.focus();
                                        return false;
                                    }
                                    if(formulario.marca.value===""){
                                        alert("O campo Marca deve ser preenchido!");
                                        formulario.marca.focus();
                                        return false;
                                    }
                                    if(formulario.id_cliente.value===""){
                                        alert("O ID do cliente deve ser preenchido!");
                                        formulario.id_cliente.focus();
                                        return false;
                                    }
                                    return true;
                                }
                            </script>
                            <form name="form_cadastrar_cliente_veiculo" action="cadastrar_cliente_veiculo.do" method="post" onsubmit="return validaForm();">    
                                <label>Data do cadastro:</label>
                                <%
                                    Date hoje = new Date();
                                    DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                    String dataCadastro = dataFormatada.format(hoje);
                                %>
                                <%=dataCadastro%>
                                <input type="hidden" name="dataCadastro" value="<%=dataCadastro%>"><br>

                                <label>Nome Completo:</label>
                                <input type="text" name="nomeCompleto" placeholder="Digite o nome completo" size="30">

                                <label>Telefone:</label>
                                <input type="text" name="telefone" placeholder="Digite o telefone" size="30">
                                
                                <label>Marca do veículo:</label>
                                <input type="text" name="marca" placeholder="Digite a marca do veículo" size="30">
                                
                                <label>Modelo do veículo:</label>
                                <input type="text" name="modelo" placeholder="Digite o modelo do veículo" size="30">

                                <label>Cor do veículo:</label>
                                <input type="text" name="cor" placeholder="Digite a cor do veículo" size="30">

                                <label>Placa do veículo:</label>
                                <input type="text" name="placa" placeholder="Digite a placa do veículo" size="30">
                                
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