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
        <title>Página Listar Perfil</title>
        <link rel="stylesheet" href="estilo_layout/perfil.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
            
            // Remover acentuações do campo observacao
             formulario.nome.value = removerAcentos(formulario.nome.value);

            function validaForm(){
                formulario = document.form_cadastrar_perfil;
                if(formulario.nome.value===""){
                    alert("O campo PERFIL deve ser preenchido!");
                    formulario.nome.focus();
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
                    Perfil
                    <button id="pop-up-cadastrar" class="botao-padrao"> + Novo </button>
                </h1>
                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Perfil</td>
                        <td style="text-align: center; font-weight: bold;">Alterar</td>
                        <td style="text-align: center; font-weight: bold;">Status</td>
                        <td style="text-align: center; font-weight: bold;">Gerenciar Acesso</td>
                    </tr>
                    
                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        PerfilDAO perfilDB = new PerfilDAO();
                        ArrayList<Perfil> lista;
                        perfilDB.conectar();
                        lista = perfilDB.listar();
                        for(Perfil perfil:lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;"><%=perfil.getNome()%></td>

                        <td style="text-align: center;">
                            <a href="form-alterar-perfil.jsp?id=<%=perfil.getId_perfil()%>"> <button class="botao-padrao"> alterar </button> </a>
                        </td>

                        <td style="text-align: center;">
                            <% if (perfil.isStatus()) { %>
                                <!-- Já que o status está ativado permite desativar -->
                                <form action="desativar_perfil.do" method="post">
                                    <input type="hidden" name="id" value="<%=perfil.getId_perfil()%>">
                                    <!-- Mostra a imagem de status ativo -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        ativado
                                    </button>
                                </form>

                            <% } else { %>

                                <!-- Já que o status está desativado permite ativar -->
                                <form action="ativar_perfil.do" method="post">
                                    <input type="hidden" name="id" value="<%=perfil.getId_perfil()%>">
                                    <!-- Mostra a imagem de status desativado -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        desativado
                                    </button>
                                </form>
                            <% } %>
                        </td>

                        <td style="text-align: center;">
                            <a href="form-gerenciar-perfil-menu.jsp?id_perfil=<%=perfil.getId_perfil()%>"> <button class="botao-padrao"> gerenciar </button> </a>
                        </td>
                    </tr>
                <%
                        }
                    perfilDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Perfil</h3>
                            <form name="form_cadastrar_perfil" action="cadastrar_perfil.do" method="post" onsubmit="return validaForm();">
                                <label>Perfil:</label>
                                <input type="text" name="nome" placeholder="Digite a forma de pagamento" size="30">
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
