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
        <link rel="stylesheet" href="estilo_layout/pop-up-usuario.css">
        <link rel="stylesheet" href="estilo_layout/perfil.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function removerAcentos(texto) {
                return texto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
            }
    
            function validaForm(){
                formulario = document.form_cadastrar_usuario;
                
                formulario.nomeCompleto.value = removerAcentos(formulario.nomeCompleto.value);
                formulario.login.value = removerAcentos(formulario.login.value);
                formulario.senha.value = removerAcentos(formulario.senha.value);
                
                
                if(formulario.nomeCompleto.value===""){
                    alert("O campo Nome Completo deve ser preenchido!!");
                    formulario.nomeCompleto.focus();
                    return false;
                }
                if(formulario.login.value===""){
                    alert("O campo Login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value===""){
                    alert("O campo Senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }
                if(formulario.dataCadastro.value===""){
                    alert("O campo Data deve ser preenchido!!");
                    formulario.dataCadastro.focus();
                    return false;
                }
                if(formulario.id_perfil.value===""){
                    alert("O campo Perfil deve ser preenchido!!");
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

            <div class="menu-section">
                <!-- Menu da página -->
                <%@include file="menu.jsp"%>
            </div>
            
            <!-- Seção da tabela -->
            <div class="table-section">
                <h1 class="page-title">
                    Usuário
                    <button id="mostrar-pop-up" class="botao-padrao"> + Novo </button>
                </h1>

                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Nome</td>
                        <td style="text-align: center; font-weight: bold;">Login</td>
                        <td style="text-align: center; font-weight: bold;">Perfil</td>
                        <td style="text-align: center; font-weight: bold;">Cadastro</td>
                        <td style="text-align: center; font-weight: bold;">Status</td>
                    </tr>

                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        UsuarioDAO uDB = new UsuarioDAO();
                        ArrayList<Usuario> lista;
                        uDB.conectar();
                        lista = uDB.listar();
                        for(Usuario usuar:lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;"><%=usuar.getPessoa().getNomeCompleto()%></td>
                        <td style="text-align: center;"><%=usuar.getLogin()%></td>

                        <td style="text-align: center;">
                            <%
                                // Atributo local, pega o Id do perfil do usuario
                                int id = usuar.getPerfil().getId_perfil();
                                // Instancia um objeto e faz conectar ao banco de dados
                                try {
                                    PerfilDAO perfilBD = new PerfilDAO();
                                    perfilBD.conectar();
                                    Perfil perf = perfilBD.pesquisarPorId(id);
                                    perfilBD.desconectar();
                             %>        
                                    <%=perf.getNome()%>
                            <%
                                } catch (Exception erro) {
                                     out.print(erro);
                                }
                            %>
                        </td>

                        <td style="text-align: center;">
                            <a href="form-alterar-usuario.jsp?id=<%=usuar.getPessoa().getId()%>"> <button class="botao-padrao"> alterar </button> </a>
                        </td>

                        <td style="text-align: center;">
                            <% if (usuar.getPerfil().isStatus()) { %>
                                <!-- Já que está ativado permite desativar o status -->
                                <form action="desativar_usuario.do" method="post">
                                    <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                    <!-- Mostra o status ativo -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        ativado
                                    </button>
                                </form>

                            <% } else { %>

                                <!-- Já que o status está desativado permite ativar -->
                                <form action="ativar_usuario.do" method="post">
                                    <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                    <!-- Mostra o status desativado -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        desativado
                                    </button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }
                    uDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
            </div>
            <div id="pop-up"> 
                <div class="botao-fechar">&times;</div>
                    <div class="formulario">
                        <h3>Cadastrar Usuario</h3>
                        <form name="form_cadastrar_usuario" action="cadastrar_usuario.do" method="post" onsubmit="return validaForm();">

                            <%
                                Date hoje = new Date();
                                DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                String dataCadastro = dataFormatada.format(hoje);
                            %>
                            <input type="hidden" name="dataCadastro" value="<%=dataCadastro%>"><br>

                            <label>Nome Completo:</label>
                            <input type="text" name="nomeCompleto" placeholder="Digite o nome completo" size="30">

                            <label>Login:</label>
                            <input type="text" name="login" placeholder="Digite o usuário" size="30">

                            <label>Senha:</label>
                            <input type="password" name="senha" placeholder="Digite a senha" size="30">

                            <label>Perfil:</label>
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
                                        for(Perfil perfill:lista){
                                            // Se o perfil tiver ativo pode ser utilizado
                                            if (perfill.isStatus()) {
                                %>
                                <option value="<%=perfill.getId_perfil()%>"><%=perfill.getNome()%></option>
                                <%          }
                                    } 
                                        pDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                %>
                            </select>

                            <div class="botao-salvar-formulario">
                                <button type="submit" value="Salvar" class="botao-salvar">Salvar</button>
                            </div>
                        </form> 
                    </div>
                <script>
                    // Comando para mostrar o Pop-up utilizando JavaScript
                    document.querySelector("#mostrar-pop-up").addEventListener("click", function() {
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
