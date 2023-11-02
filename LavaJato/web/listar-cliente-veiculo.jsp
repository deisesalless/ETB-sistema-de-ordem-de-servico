<%@page import="java.util.List"%>
<%@page import="entidade.Veiculo"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de teste - listar cliente</title>
        <script src="OnOff.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"> <script src="https://kit.fontawesome.com/0102f89b01.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <img src="imagens/banner.PNG" alt="banner"/>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp"%> 
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h3>Lista de Clientes e Veiculos</h3>
                            
                            <!-- Lista o nome do cliente-->
                            <ul type="none">
                                <%
                                    try {
                                        ClienteDAO clienteDB = new ClienteDAO();
                                        ArrayList<Cliente> lista;
                                        clienteDB.conectar();
                                        lista = clienteDB.listar();
                                        for(Cliente cliente:lista) {
                               %>
                                <li class="cliente-expansivel">
                                    <%=cliente.getPessoa().getId()%> |
                                    <%=cliente.getPessoa().getNomeCompleto()%> |
                                    <i class="fas fa-chevron-down"></i>
                                </li>
                                
                                <!-- Lista o veículo do nome do cliente de acordo com o Id-->
                                <ul class="veiculos" style="display: none" type="none">
                                    <%
                                        // ...
                                        try {
                                            VeiculoDAO veiculoDB = new VeiculoDAO();
                                            List<Veiculo> list;
                                            veiculoDB.conectar();
                                            list = veiculoDB.listar();
                                            veiculoDB.desconectar();
                                            for(Veiculo veic:list) {
                                                if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()){
                                    %>
                                                    <li class="veiculo">
                                                        <%=veic.getCliente().getPessoa().getId()%> |
                                                        <%=veic.getMarca()%> | <%=veic.getCor()%> |
                                                        <%=veic.getPlaca()%> |
                                                        <img src="imagens/novo.png" align="top"><a href="form-cadastrar-veiculo.jsp?id_cliente=<%=cliente.getPessoa().getId()%>">Veículo</a> |
                                                        <a href="form-alterar-veiculo.jsp?placa=<%=veic.getPlaca()%>"><img src="imagens/alterar.png" border="0">Alterar</a>
                                                    </li>
                                    <%
                                                }
                                            }
                                            veiculoDB.desconectar();
                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                    %>
                                </ul>
                                <%
                                        }
                                        clienteDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>   
        </div>
        <script>
            // Adicione um evento de clique a todos os elementos "cliente-expansivel"
            const clientesExpansiveis = document.querySelectorAll(".cliente-expansivel");
            clientesExpansiveis.forEach(clienteExpansivel => {
                clienteExpansivel.addEventListener("click", () => {
                    const listaVeiculos = clienteExpansivel.nextElementSibling;
                    const icone = clienteExpansivel.querySelector("i");

                    if (listaVeiculos.style.display === "none" || listaVeiculos.style.display === "") {
                        listaVeiculos.style.display = "block";
                        icone.classList.remove("fa-chevron-down");
                        icone.classList.add("fa-chevron-up");
                    } else {
                        listaVeiculos.style.display = "none";
                        icone.classList.remove("fa-chevron-up");
                        icone.classList.add("fa-chevron-down");
                    }
                });
            });
        </script>
    </body>
</html>
