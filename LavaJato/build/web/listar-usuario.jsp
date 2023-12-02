<%@page import="entidade.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Perfil"%>
<%@page import="persistencia.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teste de listar Perfil</title>
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
        <link rel="stylesheet" type="text/css" href="estilo/pagina-inteira.css">
        <link rel="stylesheet" type="text/css" href="estilo/banner.css">
        <link rel="stylesheet" type="text/css" href="estilo/usuario.css">
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
                    <h3>
                        Lista de Usuario
                        <button id="mostrar-pop-up">+ Novo</button>
                    </h3>
                    <!-- Tabela para listar os Usuarios cadastrados no banco de dados -->
                    <table width="800" border="1">
                        <tr bgcolor="#d3d3d3">
                            <td>ID</td>
                            <td>Nome Completo</td>
                            <td>Login</td>
                            <td>Perfil</td>
                            <td>Cadastro</td>
                            <td>Status</td>
                        </tr>
                        <%                                            
                            try {
                                UsuarioDAO uDB = new UsuarioDAO();
                                ArrayList<Usuario> lista;
                                uDB.conectar();
                                lista = uDB.listar();
                                for(Usuario usuar:lista) {
                        %>
                                <tr>
                                    <td><%=usuar.getPessoa().getId()%></td>
                                    <td><%=usuar.getPessoa().getNomeCompleto()%></td>
                                    <td><%=usuar.getLogin() %></td>
                                    <td>
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
                                    <td align="center">
                                        <a href="form-alterar-usuario.jsp?id=<%=usuar.getPessoa().getId()%>">
                                            <button> alterar </button>
                                        </a>
                                    </td>
                                    <td align="center">
                                        <% if (usuar.getPerfil().isStatus()) { %>
                                            <!-- Já que está ativado permite desativar o status -->
                                            <form action="desativar_usuario.do" method="post">
                                                <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                                <input type="hidden" name="status" value="true">

                                                <!-- Mostra a imagem de status ativo -->
                                                <button id="botao-alterar-tema" type="submit" value="Desativar">
                                                    <img src="./imagens/on.png" alt="imagem-online">
                                                </button>
                                             </form>
                                        <% } else { %>
                                            <!-- Já que está deativado permite ativar o status -->
                                            <form action="ativar_usuario.do" method="post">
                                                <input type="hidden" name="id" value="<%=usuar.getPessoa().getId()%>">
                                                <input type="hidden" name="status" value="true">

                                                <!-- Mostra a imagem de status desativado -->
                                                <button id="botao-alterar-tema" type="submit" value="Ativar">
                                                    <img src="./imagens/off.png" alt="imagem-offline">
                                                </button>
                                             </form>
                                        <% } %>
                                    </td>
                                </tr>	
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
                                <select name="id_perfil">
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
            </div>       
        </div>
    </body>
</html>