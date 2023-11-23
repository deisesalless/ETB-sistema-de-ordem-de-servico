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
                        <div class="item">
                        <%
                            try {
                                ClienteDAO clienteDB = new ClienteDAO();
                                ArrayList<Cliente> lista;
                                clienteDB.conectar();
                                lista = clienteDB.listar();
                                for(Cliente cliente:lista) {
                       %>
                            <div class="nome-cliente">
                                Id: <%=cliente.getPessoa().getId()%> | Telefone: <%=cliente.getTelefone()%> | Cliente: <%=cliente.getPessoa().getNomeCompleto()%>
                            </div>
                            <div class="veiculo-cliente">
                            <%
                                try {
                                    VeiculoDAO veiculoDB = new VeiculoDAO();
                                    List<Veiculo> list;
                                    veiculoDB.conectar();
                                    list = veiculoDB.listar();
                                    veiculoDB.desconectar();
                                    for(Veiculo veic:list) {
                                        if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()) {
                            %>
                                <table width="1200" border="1">
                                    <tr bgcolor="#d3d3d3">
                                        <td>ID cliente</td>
                                        <td>Placa</td>
                                        <td>Cor</td>
                                        <td>Marca</td>
                                        <td>Modelo</td>
                                        <td>Alterar</td>
                                        <td>Novo Veiculo</td>
                                        <td>Atendimento</td>
                                    </tr>
                                    <tr>
                                        <td><%=veic.getCliente().getPessoa().getId()%></td>
                                        <td><%=veic.getPlaca()%></td>
                                        <td><%=veic.getCor()%></td>
                                        <td><%=veic.getMarca()%></td>
                                        <td><%=veic.getModelo()%></td>
                                        <td align="center">
                                            <button>
                                                <a href="form-alterar-cliente-veiculo.jsp?id=<%=veic.getId()%>">
                                                    alterar
                                                </a> 
                                            </button>
                                        </td>
                                        <td align="center">
                                            <button>
                                                <a href="form-cadastrar-veiculo.jsp?id=<%=cliente.getPessoa().getId()%>">
                                                    adicionar
                                                </a> 
                                            </button>
                                        </td>
                                        <td align="center">
                                            <button>
                                                <a href="form-cadastrar-atendimento.jsp?id_veiculo=<%=veic.getId()%>">
                                                    adicionar
                                                </a> 
                                            </button>
                                        </td>
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
                            const accordion = document.getElementsByClassName('item');

                            for (i = 0; i < accordion.length; i++){
                                accordion[i].addEventListener('click', function() {
                                    this.classList.toggle('ativo')
                                })
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