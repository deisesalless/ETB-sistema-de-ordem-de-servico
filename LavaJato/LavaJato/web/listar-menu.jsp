<%@page import="entidade.Menu"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.MenuDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.TabelaPreco"%>
<%@page import="persistencia.TabelaPrecoDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Página Listar Usuario</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/pop-up-menu.css">
        <link rel="stylesheet" href="estilo_layout/perfil.css">
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

            <div class="menu-section">
                <!-- Menu da página -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção da tabela -->
            <div class="table-section">
                <h1 class="page-title">
                    Menu
                    <button id="pop-up-cadastrar" class="botao-padrao"> + Novo </button>
                </h1>

                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Menu</td>
                        <td style="text-align: center; font-weight: bold;">Link</td>
                        <td style="text-align: center; font-weight: bold;">Alterar</td>
                        <td style="text-align: center; font-weight: bold;">Excluir</td>
                    </tr>

                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        MenuDAO mDB = new MenuDAO();
                        mDB.conectar();
                        List<Menu> lista = mDB.listar();
                        for(Menu m:lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;">
                            <%=m.getMenu() %>
                        </td>
                        
                        <td style="text-align: left;">
                            <%=m.getLink() %>
                        </td>

                        <td style="text-align: center;">
                            <a href="form-alterar-menu.jsp?id_menu=<%=m.getId_menu()%>">
                                <button class="botao-padrao"> alterar </button>
                            </a>
                        </td>

                        <td style="text-align: center;">
                            <a href="excluir_menu.do?id_menu=<%=m.getId_menu()%>">
                                <button class="botao-padrao"> excluir </button>
                            </a>
                        </td>
                    </tr>
                <%
                        }
                        mDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
            </div>
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Menu</h3>
                            <form name="form_cadastrar_menu" action="cadastrar_menu.do" method="post" onsubmit="return validaForm();">
                                <label>Menu:</label>
                                <input type="text" name="menu" placeholder="Digite o nome do Menu" size="30">
                                <label>Link:</label>
                                <input type="text" name="link" placeholder="Digite o link do Menu" size="30">
                                <div class="botao-salvar-formulario">
                                    <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                                </div>
                            </form> 
                        </div>
                    <script>
                        // Comando para mostrar o Pop-up utilizando JavaScript
                        document.querySelector("#pop-up-cadastrar").addEventListener("click", function() {
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
