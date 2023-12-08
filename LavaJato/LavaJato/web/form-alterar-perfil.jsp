<%@page import="entidade.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="persistencia.PerfilDAO"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <title>Alterar Perfil</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/alterar-perfil.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
            
            // Remover acentuações do campo observacao
             formulario.nome.value = removerAcentos(formulario.nome.value);

            function validaForm(){
                formulario = document.form_alterar_perfil;
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
            
            <!-- Seção da tabela -->
            <div class="table-section">
                
                <h1 class="page-title">
                    Alterar Nome do Perfil
                </h1>
                
                <form name="form_alterar_perfil" action="alterar_perfil.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        try {
                            PerfilDAO perfilDB = new PerfilDAO();
                            perfilDB.conectar();
                            Perfil perfil = perfilDB.pesquisarPorId(id);
                    %>
                        <tr>
                            <td>
                                <input type="hidden" name="id" value="<%=perfil.getId_perfil()%>">
                                <input type="text" name="nome" value="<%=perfil.getNome()%>" size="100%">
                            </td>
                        </tr>
                    <%
                        perfilDB.desconectar();
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
