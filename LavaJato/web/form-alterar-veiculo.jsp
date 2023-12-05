<%@page import="entidade.Veiculo"%>
<%@page import="persistencia.VeiculoDAO"%>
<%@page import="entidade.Menu"%>
<%@page import="persistencia.MenuDAO"%>
<%@page import="entidade.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="entidade.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.PerfilDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Alterar Veiculo</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/alterar-usuario.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
                    function removerAcentos(texto) {
                        return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                    }                                

                    function validaForm(){
                        formulario = document.form_alterar_veiculo;

                        formulario.placa.value = removerAcentos(formulario.placa.value);
                        formulario.cor.value = removerAcentos(formulario.cor.value);
                        formulario.marca.value = removerAcentos(formulario.marca.value);

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
             
             <!-- Menu da página -->
            <div class="menu-section">
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção da tabela -->
            <div class="table-section">
                
                <h1 class="page-title"> Alterar Informações do Veículo </h1>
                
                <form name="form_alterar_veiculo" action="alterar_veiculo.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
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
                            <td style="text-align:left; font-weight: bold;">
                                Placa
                            </td>
                            <td>
                                <input type="text" name="placa" value="<%=veic.getPlaca()%>" size="70%">
                                <input type="hidden" name="id_veiculo" value="<%=veic.getId()%>">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Cor
                            </td>
                            <td>
                                <input type="text" name="cor" value="<%=veic.getCor()%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Marca
                            </td>
                            <td>
                                <input type="text" name="marca" value="<%=veic.getMarca()%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Modelo
                            </td>
                            <td>
                                <input type="text" name="modelo" value="<%=veic.getModelo()%>" size="70%">
                            </td>
                        </tr>

                    <%  
                            }
                        veicDB.desconectar();
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                    </table>
                    
                    <button type="submit" value="Salvar" class="botao-padrao botao-salvar"> Salvar </button>
                </form>
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
