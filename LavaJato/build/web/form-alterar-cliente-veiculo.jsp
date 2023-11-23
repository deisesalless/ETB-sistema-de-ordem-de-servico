<%@page import="java.util.List"%>
<%@page import="entidade.Veiculo"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cliente e Veiculo</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/perfil.css">
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
                    <h3> Alterar Cliente & Veiculo </h3>
                    
                    <script language="javascript" >
                        function validaForm(){
                            formulario = document.form_alterar_cliente_veiculo;
                            if(formulario.id_cliente.value===""){
                                alert("O campo ID do cliente não foi encontrado!");
                                formulario.id_cliente.focus();
                                return false;
                            }
                            if(formulario.nomeCompleto.value===""){
                                alert("O campo Nome Completo deve ser preenchido!");
                                formulario.nomeCompleto.focus();
                                return false;
                            }
                            if(formulario.telefone.value===""){
                                alert("O campo Telefone deve ser preenchido!");
                                formulario.telefone.focus();
                                return false;
                            }
                            if(formulario.id_veiculo.value===""){
                                alert("O campo ID do veículo não foi encontrado!");
                                formulario.id_veiculo.focus();
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
                            if(formulario.modelo.value===""){
                                alert("O campo Modelo deve ser preenchido!");
                                formulario.modelo.focus();
                                return false;
                            }
                            return true;
                        }
                    </script>
                    
                    <form name="form_alterar_cliente_veiculo" action="alterar_cliente_veiculo.do" method="post" onsubmit="return validaForm();">
                        <table width="800">
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));

                            try {
                                VeiculoDAO veicDB = new VeiculoDAO();
                                veicDB.conectar();
                                Veiculo veic = veicDB.pesquisarPorId(id);
                                veicDB.desconectar();
                                if(veic.getId() > 0) {    
                        %>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    ID
                                </td>
                                <td>
                                    <%=veic.getCliente().getPessoa().getId()%>
                                    <input type="hidden" name="id_cliente" value="<%=veic.getCliente().getPessoa().getId()%>">
                                </td>
                            </tr>
                            <%
                                try {
                                       ClienteDAO clientDB = new ClienteDAO();
                                       clientDB.conectar();
                                       Cliente client = clientDB.pesquisarPorId(veic.getCliente().getPessoa().getId());
                                       if (client.getPessoa().getId() > 0) {
                            %>
                            
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Nome Completo
                                </td>
                                <td>
                                    <input type="text" name="nomeCompleto" value="<%=client.getPessoa().getNomeCompleto()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Telefone
                                </td>
                                <td>
                                    <input type="text" name="telefone" value="<%=client.getTelefone()%>" size="50%">
                                </td>
                            </tr>
                            
                            <%
                                       }
                                       
                                       clientDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                            %>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    ID
                                </td>
                                <td>
                                    <%=veic.getId()%>
                                    <input type="hidden" name="id_veiculo" value="<%=veic.getId()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Placa
                                </td>
                                <td>
                                    <input type="text" name="placa" value="<%=veic.getPlaca()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Cor
                                </td>
                                <td>
                                    <input type="text" name="cor" value="<%=veic.getCor()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Marca
                                </td>
                                <td>
                                    <input type="text" name="marca" value="<%=veic.getMarca()%>" size="50%">
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#d3d3d3">
                                    Modelo
                                </td>
                                <td>
                                    <input type="text" name="modelo" value="<%=veic.getModelo()%>" size="50%">
                                </td>
                            </tr>
                                                       
                        <%
                                }
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Salvar"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>       
        </div>
    </body>
</html>