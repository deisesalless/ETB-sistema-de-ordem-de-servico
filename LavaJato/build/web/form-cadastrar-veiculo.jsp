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
        <title>Cadastrar Veiculo</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/form-cadastrar-veiculo.css">
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
                    <h3> Cadastrar Veiculo </h3>
                    
                    <script language="javascript" >
                        function validaForm(){
                            formulario = document.form_cadastrar_veiculo;
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
                    
                    <form name="form_cadastrar_veiculo" action="cadastrar_veiculo.do" method="post" onsubmit="return validaForm();">
                        <%
                            // Atributo local, pega o Identificador que veio da página Listar Usuario
                            int id = Integer.parseInt(request.getParameter("id"));
                            // Instancia um objeto e conecta ao banco de dados
                            try {
                                ClienteDAO clientDB = new ClienteDAO();
                                clientDB.conectar();
                                Cliente client = clientDB.pesquisarPorId(id);
                                clientDB.desconectar();
                                if (client.getPessoa().getId() > 0) {
                        %>
                        
                        <label>ID:</label>
                        <%=client.getPessoa().getId()%>
                        <input type="hidden" name="id_cliente" value="<%=client.getPessoa().getId()%>">
                                    
                        <label>Nome Completo:</label>
                        <%=client.getPessoa().getNomeCompleto()%>
                        <input type="hidden" name="nomeCompleto" value="<%=client.getPessoa().getNomeCompleto()%>" size="30">

                        <label>Telefone:</label>
                        <%=client.getTelefone()%>
                        <input type="hidden" name="telefone" value="<%=client.getTelefone()%>" size="30">
                        
                        <%
                                }
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        %>
                        <label>Marca do veículo:</label>
                        <input type="text" name="marca" placeholder="Digite a marca do veículo" size="30">

                        <label>Modelo do veículo:</label>
                        <input type="text" name="modelo" placeholder="Digite o modelo do veículo" size="30">

                        <label>Cor do veículo:</label>
                        <input type="text" name="cor" placeholder="Digite a cor do veículo" size="30">

                        <label>Placa do veículo:</label>
                        <input type="text" name="placa" placeholder="Digite a placa do veículo" size="30"><br>

                        <button type="submit" value="Salvar">Salvar</button>
                    </form>
                </div>
            </div>       
        </div>
    </body>
</html>