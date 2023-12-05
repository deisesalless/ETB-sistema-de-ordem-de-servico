<%@page import="entidade.Cliente"%>
<%@page import="persistencia.ClienteDAO"%>
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
        <title>Alterar Cliente</title>
        <link rel="stylesheet" href="estilo_layout/alterar-usuario.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }                                

            function validaForm(){
                formulario = document.form_alterar_cliente;

                formulario.nomeCompleto.value = removerAcentos(formulario.nomeCompleto.value);
                formulario.telefone.value = removerAcentos(formulario.telefone.value);
                
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
                
                <h1 class="page-title"> Alterar Cadastro do Cliente </h1>
                
                <form name="form_alterar_cliente" action="alterar_cliente.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        try {
                            ClienteDAO clientDB = new ClienteDAO();
                            clientDB.conectar();
                            Cliente client = clientDB.pesquisarPorId(id);
                            if(client.getPessoa().getId() > 0) {  
                    %>
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Nome Completo
                            </td>
                            <td>
                                <input type="text" name="nomeCompleto" value="<%=client.getPessoa().getNomeCompleto()%>" size="70%">
                                <input type="hidden" name="id_cliente" value="<%=client.getPessoa().getId()%>">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Telefone
                            </td>
                            <td>
                                <input type="text" name="telefone" value="<%=client.getTelefone()%>" size="70%">
                            </td>
                        </tr>

                    <%
                            }
                        clientDB.desconectar();
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
