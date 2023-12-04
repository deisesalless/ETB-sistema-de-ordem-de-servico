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
        <title>Alterar Menu</title>
        <link rel="stylesheet" href="estilo_layout/alterar-usuario.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
            
            function validaForm(){
                formulario = document.form_cadastrar_menu;
                
                formulario.menu.value = removerAcentos(formulario.menu.value);
                formulario.link.value = removerAcentos(formulario.link.value);
                
                if(formulario.menu.value===""){
                    alert("O campo MENU deve ser preenchido!");
                    formulario.menu.focus();
                    return false;
                }
                if(formulario.link.value===""){
                    alert("O campo LINK deve ser preenchido!");
                    formulario.link.focus();
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
                
                <h1 class="page-title"> Alterar Menu </h1>
                
                <form name="form_alterar_menu" action="alterar_menu.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
                    <%
                        int id_menu = Integer.parseInt(request.getParameter("id_menu"));

                        try {
                            MenuDAO menuDB = new MenuDAO();
                            menuDB.conectar();
                            Menu menu = menuDB.pesquisarPorId(id_menu);
                    %>
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Menu
                            </td>
                            <td>
                                <input type="text" name="menu" value="<%=menu.getMenu()%>" size="70%">
                                <input type="hidden" name="id_menu" value="<%=menu.getId_menu()%>">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Link
                            </td>
                            <td>
                                <input type="text" name="link" value="<%=menu.getLink()%>" size="70%">
                            </td>
                        </tr>

                    <%
                        menuDB.desconectar();
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
