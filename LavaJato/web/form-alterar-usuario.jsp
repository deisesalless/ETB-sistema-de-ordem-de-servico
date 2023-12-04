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
        <title>Alterar Usuario</title>
        <link rel="stylesheet" href="estilo_layout/alterar-usuario.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
    
            function validaForm(){
                formulario = document.form_alterar_usuario;
                
                formulario.nomeCompleto.value = removerAcentos(formulario.nomeCompleto.value);
                formulario.login.value = removerAcentos(formulario.login.value);
                formulario.senha.value = removerAcentos(formulario.senha.value);
                
                if(formulario.nomeCompleto.value===""){
                    alert("O campo NOME COMPLETO deve ser preenchido!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.login.value===""){
                    alert("O campo LOGIN deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value===""){
                    alert("O campo SENHA deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }
                if(formulario.id_perfil.value===""){
                    alert("O campo PERFIL deve ser preenchido!");
                    formulario.id_perfil.focus();
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
                
                <h1 class="page-title"> Alterar Cadastro do Usuário </h1>
                
                <form name="form_alterar_usuario" action="alterar_usuario.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <!-- Dados da tabela -->
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                        try {
                            UsuarioDAO uDB = new UsuarioDAO();
                            uDB.conectar();
                            List<Usuario> usu;
                            usu = uDB.pesquisarPorId(id);
                            uDB.desconectar();
                            for (Usuario usuarioo:usu) {
                                if (usuarioo.getPessoa().getId() > 0){
                    %>
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Nome Completo
                            </td>
                            <td>
                                <input type="text" name="nomeCompleto" value="<%=usuarioo.getPessoa().getNomeCompleto()%>" size="70%">
                                <input type="hidden" name="id" value="<%=usuarioo.getPessoa().getId()%>">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Usuario
                            </td>
                            <td>
                                <input type="text" name="login" value="<%=usuarioo.getLogin()%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Senha
                            </td>
                            <td>
                                <input type="password" name="senha" value="<%=usuarioo.getSenha()%>" size="70%">
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="text-align:left; font-weight: bold;">
                                Perfil
                            </td>
                            <td>
                                <select name="id_perfil" class="select">
                                    <option value="" selected>Escolha um Perfil</option>
                                    <!-- Cria um objeto, e um atributo lista para conectar com o 
                                    // banco de dados e trazer a lista de nomes do perfil -->
                                    <%
                                        try {
                                            PerfilDAO pDB = new PerfilDAO();
                                            ArrayList<Perfil> lista;
                                            pDB.conectar();
                                            lista = pDB.listar();
                                            // Lista os perfis
                                            for(Perfil perfill:lista) {
                                                // Se o perfil tiver ativo pode ser utilizado
                                                if (perfill.isStatus()) {
                                    %>
                                    <option value="<%=perfill.getId_perfil()%>"><%=perfill.getNome()%></option>
                                    <% 
                                                }
                                            } 
                                            pDB.desconectar();
                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                    %>
                                </select>  
                            </td>
                        </tr>

                    <%
                                }
                            }
                            uDB.desconectar();
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
