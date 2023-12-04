<%@page import="entidade.FormaDePagamento"%>
<%@page import="persistencia.FormaDePagamentoDAO"%>
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
        <link rel="stylesheet" href="estilo_layout/pop-up-perfil.css">
        <link rel="stylesheet" href="estilo_layout/perfil.css">
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
                    Formas de Pagamento
                    <button id="mostrar-pop-up" class="botao-padrao"> + Novo </button>
                </h1>
                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Tipo</td>
                        <td style="text-align: center; font-weight: bold;">Alterar</td>
                        <td style="text-align: center; font-weight: bold;">Status</td>
                    </tr>
                    
                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        FormaDePagamentoDAO tipo_pagDB = new FormaDePagamentoDAO();
                        ArrayList<FormaDePagamento> lista;
                        tipo_pagDB.conectar();
                        lista = tipo_pagDB.listar();
                        for(FormaDePagamento tipo_pag:lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;"><%=tipo_pag.getServicoPreco().getNome()%></td>

                        <td style="text-align: center;">
                            <a href="form-alterar-tipo-pagamento.jsp?id=<%=tipo_pag.getServicoPreco().getId()%>"> <button class="botao-padrao"> alterar </button> </a>
                        </td>

                        <td style="text-align: center;">
                            <% if (tipo_pag.getServicoPreco().isStatus()) { %>
                                <!-- Já que o status está ativado permite desativar -->
                                <form action="desativar_pagamento.do" method="post">
                                    <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                    <!-- Mostra a imagem de status ativo -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        ativado
                                    </button>
                                </form>

                            <% } else { %>

                                <!-- Já que o status está desativado permite ativar -->
                                <form action="ativar_pagamento.do" method="post">
                                    <input type="hidden" name="id" value="<%=tipo_pag.getServicoPreco().getId()%>">
                                    <!-- Mostra a imagem de status desativado -->
                                    <button id="botao-alterar-tema" type="submit" class="botao-padrao">
                                        desativado
                                    </button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                <%
                    }
                    tipo_pagDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
                
                <div id="pop-up"> 
                    <div class="botao-fechar">&times;</div>
                        <div class="formulario">
                            <h3>Cadastrar Forma de Pagamento</h3>
                            <form name="form_cadastrar_tipo_pagamento" action="cadastrar_tipo_pagamento.do" method="post" onsubmit="return validaForm();">
                                <label>Nome:</label>
                                <input type="text" name="nome" placeholder="Digite a forma de pagamento" size="30">
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
