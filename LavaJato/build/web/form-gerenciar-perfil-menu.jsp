<%@page import="java.util.List"%>
<%@page import="entidade.Menu"%>
<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/gerenciar-perfil.css">
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
                
                <div class="conteudo" align="center">
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
                    <h3>
                        Gerenciar Acessos do Perfil:
                        <br> <br>
                        <%=perfil.getNome()%>
                    </h3>
                    
                    <div class="conteiner">
                        <div class="lado1">
                            <!-- Tabela de vincular -->                
                            <table width="600" border="1">
                                <tr>
                                    <td align="center">ID</td>
                                    <td align="center">MENU</td>
                                    <td align="center">VINCULAR</td>
                                </tr>
                                <%
                                  for (Menu m : listaDesvinculados) {
                                %>
                                <tr>
                                    <td align="center"><%=m.getId_menu()%></td>
                                    <td><%=m.getMenu()%></td>
                                    <td align="center">
                                        <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId_menu()%>&id_perfil=<%=perfil.getId_perfil()%>&op=vincular">
                                            <button> adicionar </button>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                 }
                                %>
                            </table>
                        </div>
                        
                        <div class="lado2">
                            <!-- Tabela de desvincular -->
                            <table width="600" border="1">
                                <tr>
                                    <td align="center">ID</td>
                                    <td align="center">MENU</td>
                                    <td align="center">DESVINCULAR</td>
                                </tr>
                                <%
                                  for (Menu m : listaVinculados) {
                                %>
                                <tr>
                                    <td align="center"><%=m.getId_menu()%></td>
                                    <td><%=m.getMenu()%></td>
                                    <td align="center">
                                        <a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId_menu()%>&id_perfil=<%=perfil.getId_perfil()%>&op=desvincular">
                                            <button> remover </button>
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
        </div>
    </body>
</html>