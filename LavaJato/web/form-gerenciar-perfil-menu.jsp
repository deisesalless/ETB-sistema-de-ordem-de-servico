<%@page import="entidade.Menu"%>
<%@page import="java.util.List"%>
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
        <title>Gerenciar Menu</title>
        <link rel="stylesheet" href="estilo_layout/gerenciar-menu.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <link rel="stylesheet" href="estilo_layout/pop-up.css">
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
             
             <!-- Menu da página -->
            <div class="menu-section">
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção do conteúdo da página -->
            <div class="main-content">
                
                <%
                    int id = Integer.parseInt(request.getParameter("id_perfil"));
                    Perfil perfil = new Perfil();
                    List<Menu> listaVinculados = new ArrayList<Menu>();
                    List<Menu> listaDesvinculados = new ArrayList<Menu>();
                    try {
                        PerfilDAO pDB = new PerfilDAO();
                        pDB.conectar();

                        perfil = pDB.pesquisarPorId(id);
                        listaVinculados = pDB.menusVinculados(id);
                        listaDesvinculados = pDB.menusDesvinculados(id);

                        pDB.desconectar();

                    } catch (Exception e) {
                        out.print(e);
                    }
                %>
                
                <h1 class="page-title">
                    Gerenciar Acessos do Perfil: <%=perfil.getNome()%> <br>
                </h1>

                <div class="box">
                    <div class="side1">
                        <!-- Tabela de vincular -->                
                        <table>
                            <tr>
                                <td align="center">MENU</td>
                                <td align="center">VINCULAR</td>
                            </tr>
                            <%
                              for (Menu m : listaDesvinculados) {
                            %>
                            <tr>
                                <td align="left"><%=m.getMenu()%></td>
                                <td align="center">
                                    <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId_menu()%>&id_perfil=<%=perfil.getId_perfil()%>&op=vincular">
                                        <button class="botao-padrao"> adicionar </button>
                                    </a>
                                </td>
                            </tr>
                            <%
                             }
                            %>
                        </table>
                    </div>

                    <div class="side2">
                        <!-- Tabela de desvincular -->
                        <table width="600" border="1">
                            <tr>
                                <td align="center">MENU</td>
                                <td align="center">DESVINCULAR</td>
                            </tr>
                            <%
                              for (Menu m : listaVinculados) {
                            %>
                            <tr>
                                <td align="left">
                                    <%=m.getMenu()%>
                                </td>
                                <td align="center">
                                    <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId_menu()%>&id_perfil=<%=perfil.getId_perfil()%>&op=desvincular">
                                        <button class="botao-padrao"> remover </button>
                                    </a>
                                </td>
                            </tr>
                            <%
                             }
                            %>
                        </table>
                    </div>
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
