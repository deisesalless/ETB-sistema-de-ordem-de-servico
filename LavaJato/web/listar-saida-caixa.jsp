<%@page import="entidade.FluxoDeCaixa"%>
<%@page import="java.util.List"%>
<%@page import="persistencia.FluxoDeCaixaDAO"%>
<%@page import="entidade.Funcionario"%>
<%@page import="persistencia.FuncionarioDAO"%>
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
        <title>Página Listar e Cadastrar Saída de Valores Fluxo de Caixa</title>
        <link rel="stylesheet" href="estilo_layout/pop-up-usuario.css">
        <link rel="stylesheet" href="estilo_layout/perfil.css">
        <link rel="stylesheet" href="estilo_layout/menu.css">
        <link rel="stylesheet" href="estilo_layout/cabecalho-rodape.css">
        <script src="js/OnOff.js"></script>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_cadastrar_valor_saida;
                if(formulario.nome.value===""){
                    alert("O campo DESCRIÇÃO deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.valor.value===""){
                    alert("O campo VALOR deve ser preenchido!!");
                    formulario.valor.focus();
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
                    Saída de Valores - Fluxo de Caixa
                    <button id="mostrar-pop-up" class="botao-padrao"> + Novo </button>
                </h1>

                <table>
                    <tr>
                        <td style="text-align: center; font-weight: bold;">Data e Hora</td>
                        <td style="text-align: center; font-weight: bold;">Descrição</td>
                        <td style="text-align: center; font-weight: bold;">Valor</td>
                        <td style="text-align: center; font-weight: bold;">Excluir</td>
                    </tr>

                    <!-- Dados da tabela -->
                <%                                            
                    try {
                        FluxoDeCaixaDAO fluxoDeCaixaDB = new FluxoDeCaixaDAO();
                        fluxoDeCaixaDB.conectar();

                        List<FluxoDeCaixa> lista = fluxoDeCaixaDB.listar();
                        for(FluxoDeCaixa fluxoDeCaixa : lista) {
                %>
                    <tr>
                        <!-- Colunas da tabela -->
                        <td style="text-align: left;">
<%
                            SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                            String dataCadastro = dataFormatada.format(fluxoDeCaixa.getData());
%>                          <%=dataCadastro%>
                        </td>
                        
                        <td style="text-align: center;">
                            <%=fluxoDeCaixa.getDescricao()%>
                        </td>
                        
                        <td style="text-align: center;">
<%
                            DecimalFormat formato = new DecimalFormat("0.00");
                            Double precoValorTotal = fluxoDeCaixa.getValor();
                            String valorTotalPreco = formato.format(precoValorTotal);
%>                          <%=valorTotalPreco%>
                        </td>

                        <td style="text-align: center;">
                            <a href="excluir_saida_caixa.do?id=<%=fluxoDeCaixa.getId()%>"> <button class="botao-padrao"> excluir </button> </a>
                        </td>

                    </tr>
                <%
                        }
                    fluxoDeCaixaDB.desconectar(); 
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
                </table>
            </div>
            <div id="pop-up"> 
                <div class="botao-fechar">&times;</div>
                    <div class="formulario">
                        <h3>Cadastrar Saída</h3>
                        <form name="form_cadastrar_valor_saida" action="cadastrar_valor_saida.do" method="post" onsubmit="return validaForm();">

                            <%
                                Date hoje = new Date();
                                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                                String dataCadastro = dataFormatada.format(hoje);
                            %>
                            <input type="hidden" name="dataCadastro" value="<%=dataCadastro%>"><br>

                            <label>Descrição:</label>
                            <input type="text" name="nome" placeholder="Digite o nome/motivo da saída" size="30">

                            <label>Valor:</label>
                            <input type="text" name="valor" placeholder="Digite o valor" size="30">

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
