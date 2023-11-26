package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entidade.Atendimento;
import persistencia.UsuarioDAO;
import entidade.Funcionario;
import persistencia.FuncionarioDAO;
import entidade.FormaDePagamento;
import persistencia.FormaDePagamentoDAO;
import java.util.List;
import persistencia.VeiculoDAO;
import entidade.Veiculo;
import persistencia.ClienteDAO;
import entidade.Cliente;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import java.text.DecimalFormat;
import entidade.TabelaPreco;
import persistencia.TabelaPrecoDAO;
import java.util.ArrayList;
import entidade.Perfil;
import persistencia.PerfilDAO;
import entidade.Usuario;

public final class form_002dcadastrar_002datendimento_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/menu.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html xmlns:h=\"http://xmlns.jcp.org/jsf/html\" xmlns:f=\"http://xmlns.jcp.org/jsf/core\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Cadastrar Atendimento</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/pagina-inteira.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/banner.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/cadastrar-atendimento.css\">\n");
      out.write("        <script src=\"javascript/On&Off.js\"></script>\n");
      out.write("        <script src=\"javascript/CarrinhoDeServicos.js\"></script>\n");
      out.write("        <script src=\"javascript/ValorAdicional.js\"></script>\n");
      out.write("        <script src=\"javascript/ValorDesconto.js\"></script>\n");
      out.write("        <script src=\"javascript/Processar-pop-up.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"overlay\"></div>\n");
      out.write("        <div id=\"pagina\">\n");
      out.write("            \n");
      out.write("            <div id=\"banner\">\n");
      out.write("                <img src=\"imagens/banner.PNG\" alt=\"banner\">\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"menu\">\n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Página de Menu</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table width=\"100%\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    ");
 // Mostra o usuario que está logado
                        Usuario usuario = new Usuario();
                        try{
                            usuario = (Usuario) session.getAttribute("usuario");
                            out.print("Olá " + usuario.getLogin() + " (<a href='sair.jsp'>Sair</a>)");
                            if (usuario == null){
                                response.sendRedirect("index.jsp");
                            }
                        }catch(Exception e){
                            //out.print(e);
                            response.sendRedirect("index.jsp");
                        }

                    
      out.write("\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"pagina-inicial.jsp\"> Inicio </a> |\n");
      out.write("                    <a href=\"listar-perfil.jsp\"> Perfil </a> |\n");
      out.write("                    <a href=\"listar-usuario.jsp\"> Usuario </a> |\n");
      out.write("                    <a href=\"listar-menu.jsp\"> Menu </a> |\n");
      out.write("                    <a href=\"listar-funcionario.jsp\"> Funcionario </a> |\n");
      out.write("                    <a href=\"listar-tipo-pagamento.jsp\"> Formas de Pagamento </a> |\n");
      out.write("                    <a href=\"listar-tabela-preco.jsp\"> Tabela de Preços </a> |\n");
      out.write("                    <a href=\"listar-cliente-veiculo.jsp\"> Cliente & Veiculo </a> |\n");
      out.write("                    <a href=\"listar-cliente-veiculo.jsp\"> Listar Atendimentos </a> |\n");
      out.write("                <td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write(" \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"principal\">\n");
      out.write("                \n");
      out.write("                <div class=\"conteudo\">\n");
      out.write("                    <h3> Cadastrar Atendimento </h3>                                        \n");
      out.write("                        \n");
      out.write("                    <div class=\"conteiner\">\n");
      out.write("                        <div class=\"lado1\">\n");
      out.write("\n");
      out.write("                            ");


                                try {

                                        int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));

                                        VeiculoDAO veiculoDB = new VeiculoDAO();
                                        ClienteDAO  clienteDB = new ClienteDAO();
                                        TabelaPrecoDAO precoDB = new TabelaPrecoDAO();
                                        FormaDePagamentoDAO tipoPagamento = new FormaDePagamentoDAO();
                                        FuncionarioDAO funcionarioDB = new FuncionarioDAO();

                                        funcionarioDB.conectar();
                                        veiculoDB.conectar();
                                        clienteDB.conectar();
                                        precoDB.conectar();
                                        tipoPagamento.conectar();

                                        Veiculo veiculo = veiculoDB.pesquisarPorId(id_veiculo);
                                        Cliente cliente = clienteDB.pesquisarPorId(veiculo.getCliente().getPessoa().getId());

                                        ArrayList<Funcionario> lista = funcionarioDB.listar();
                                        ArrayList<FormaDePagamento> list = tipoPagamento.listar();
                                        ArrayList<TabelaPreco> lis = precoDB.listar();

                            
      out.write("\n");
      out.write("\n");
      out.write("                            ");

                                        if(veiculo.getId() > 0 && (veiculo.getCliente().getPessoa().getId() == cliente.getPessoa().getId())) {
                            
      out.write("\n");
      out.write("\n");
      out.write("                            <label> ID Cliente: </label>\n");
      out.write("                            ");
      out.print(cliente.getPessoa().getId());
      out.write(" <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <label> Cliente: </label>\n");
      out.write("                            ");
      out.print(cliente.getPessoa().getNomeCompleto());
      out.write(" <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <label> Telefone: </label>\n");
      out.write("                            ");
      out.print(cliente.getTelefone());
      out.write(" <br>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <label> Informações do Veiculo: </label> <br>\n");
      out.write("                            <label> ID Veiculo: </label> ");
      out.print(veiculo.getId());
      out.write(" |\n");
      out.write("                            \n");
      out.write("                            <label> ID Cliente: </label> ");
      out.print(veiculo.getCliente().getPessoa().getId());
      out.write(" |\n");
      out.write("                            <label> Placa: </label> ");
      out.print(veiculo.getPlaca());
      out.write(" |\n");
      out.write("                            <label> Cor: </label> ");
      out.print(veiculo.getCor());
      out.write(" |\n");
      out.write("                            <label> Marca: </label> ");
      out.print(veiculo.getMarca());
      out.write(" |\n");
      out.write("                            <label> Modelo: </label> ");
      out.print(veiculo.getModelo());
      out.write("\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                            ");
    
                                        }
                            
      out.write("\n");
      out.write("                        <div class=\"lado2\">\n");
      out.write("                            <label> Observação: </label> <br>\n");
      out.write("                            <textarea class=\"observacao\" id=\"observacaoInput\" placeholder=\"Digite aqui as observações do veículo/cliente\"></textarea>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                        \n");
      out.write("                    <div class=\"conteiner-box\">\n");
      out.write("\n");
      out.write("                        <!-- Valor Adicional -->\n");
      out.write("                        <div class=\"lado1\"> \n");
      out.write("                            <label> Valor Adicional: </label>\n");
      out.write("                            <button onclick=\"adicionarValorAdicional()\"> adicionar </button> <br>\n");
      out.write("                            <input class=\"adicional\" type=\"text\" id=\"valorAdicionalInput\" placeholder=\"Digite somente o valor, exemplo: 15,00\" size=\"35\">\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <!-- Valor Desconto -->\n");
      out.write("                        <div class=\"lado2\">\n");
      out.write("                            <label> Valor de Desconto: </label>\n");
      out.write("                            <button onclick=\"adicionarValorDesconto()\"> adicionar </button> <br>\n");
      out.write("                            <input class=\"adicional\" type=\"text\" id=\"valorDescontoInput\" placeholder=\"Digite somente o valor, exemplo: -15,00\" size=\"35\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                        \n");
      out.write("                    <div class=\"conteiner\">\n");
      out.write("                        <div class=\"tabela-precos\" class=\"lado1\">\n");
      out.write("\n");
      out.write("                            <span style=\"display: block; text-align: center;\"> Tabela de Serviços </span>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            ");

                                for(TabelaPreco tabelaPreco:lis) {
                                    if (tabelaPreco.isStatus()) {
                            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <div>\n");
      out.write("                                <span> ");
      out.print(tabelaPreco.getId());
      out.write(" - ");
      out.print(tabelaPreco.getNome());
      out.write(" : </span> <br>\n");
      out.write("\n");
      out.write("                                <button onclick=\"adicionarServico('");
      out.print( tabelaPreco.getId() );
      out.write("', '");
      out.print( tabelaPreco.getNome() );
      out.write("', '");
      out.print( tabelaPreco.getPrecoVeiculoPequeno() );
      out.write("')\">\n");
      out.write("                                    Pequeno\n");
      out.write("                                </button>\n");
      out.write("\n");
      out.write("                                <button onclick=\"adicionarServico('");
      out.print( tabelaPreco.getId() );
      out.write("', '");
      out.print( tabelaPreco.getNome() );
      out.write("', '");
      out.print( tabelaPreco.getPrecoVeiculoMedio() );
      out.write("')\">\n");
      out.write("                                    Médio\n");
      out.write("                                </button>\n");
      out.write("\n");
      out.write("                                <button onclick=\"adicionarServico('");
      out.print( tabelaPreco.getId() );
      out.write("', '");
      out.print( tabelaPreco.getNome() );
      out.write("', '");
      out.print( tabelaPreco.getPrecoVeiculoGrande() );
      out.write("')\">\n");
      out.write("                                    Grande\n");
      out.write("                                </button>\n");
      out.write("\n");
      out.write("                                <br><br>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            ");

                                    }
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"tabela-carrinho\" class=\"lado2\">\n");
      out.write("\n");
      out.write("                            <span style=\"display: block; text-align: center;\"> Serviços Selecionados </span>\n");
      out.write("                            <br>\n");
      out.write("\n");
      out.write("                            <table id=\"tabelaCarrinho\" width=\"700px\" border=\"1\">\n");
      out.write("                                \n");
      out.write("                                <tr id=\"valorTotalCarrinho\">\n");
      out.write("                                    <td></td><td></td>\n");
      out.write("                                    <td align=\"right\"> Valor total: R$ </td>\n");
      out.write("                                    \n");
      out.write("                                    <!-- Aqui mostra o valor total atualizado e repassa para o input -->\n");
      out.write("                                    <td align=\"right\" id=\"valorTotal\"> 0,00 </td>\n");
      out.write("                                </tr>  \n");
      out.write("                                \n");
      out.write("                                <tr bgcolor=\"#d3d3d3\" align=\"center\">\n");
      out.write("                                    <td width=\"150px\"> Desvincular Serviço </td>\n");
      out.write("                                    <td> ID </td>\n");
      out.write("                                    <td> SERVIÇO </td>\n");
      out.write("                                    <td align=\"right\" class=\"valorUnitario\"> VALOR UND </td>\n");
      out.write("                                </tr>\n");
      out.write("                                \n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                            \n");
      out.write("                    <div class=\"botao-finalizar-cadastro\">\n");
      out.write("                        <button id=\"mostrar-pop-up\"> Finalizar Cadastro </button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                        \n");
      out.write("                <div id=\"pop-up\"> \n");
      out.write("                    <div class=\"botao-fechar\">&times;</div>\n");
      out.write("                        <div class=\"formulario\">\n");
      out.write("                            <h3>Confirmação do Pedido de Atendimento</h3>\n");
      out.write("                        <script language=\"javascript\" >\n");
      out.write("                            function validaForm(){\n");
      out.write("                                formulario = document.form_cadastrar_atendimento;\n");
      out.write("                                if(formulario.id_funcionario.value===\"\"){\n");
      out.write("                                    alert(\"O campo RESPONSÁVEL PELO ATENDIMENTO deve ser preenchido!\");\n");
      out.write("                                    formulario.id_funcionario.focus();\n");
      out.write("                                    return false;\n");
      out.write("                                }\n");
      out.write("                                return true;\n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                            <form name=\"form_cadastrar_atendimento\" action=\"cadastrar_atendimento.do\" method=\"post\" onsubmit=\"return validaForm();\">\n");
      out.write("                                \n");
      out.write("                            ");

                                Date hoje = new Date();
                                DateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                                String dataCadastro = dataFormatada.format(hoje);
                            
      out.write("                                \n");
      out.write("                                <label>Data:</label>\n");
      out.write("                                ");
      out.print(dataCadastro);
      out.write("\n");
      out.write("                                <input type=\"hidden\" name=\"data\" value=\"");
      out.print(dataCadastro);
      out.write("\">\n");
      out.write("                                <br>\n");
      out.write("                                \n");
      out.write("                                ");
 // Mostra o usuario que está logado
                                    try{
                                        usuario = (Usuario) session.getAttribute("usuario");
                                        usuario.getPessoa().getId();
                                    }catch(Exception erro){
                                        out.print(erro);
                                    }
                                
      out.write("                                \n");
      out.write("                                <label>Usuario:</label>\n");
      out.write("                                ");
      out.print(usuario.getLogin());
      out.write("\n");
      out.write("                                <input type=\"hidden\" name=\"id_usuario\" value=\"");
      out.print(usuario.getPessoa().getId());
      out.write("\">\n");
      out.write("                                <br>\n");
      out.write("                                \n");
      out.write("                                <label>Cliente:</label>\n");
      out.write("                                ");
      out.print(cliente.getPessoa().getNomeCompleto());
      out.write("\n");
      out.write("                                <input type=\"hidden\" name=\"id_cliente\" value=\"");
      out.print(cliente.getPessoa().getId());
      out.write("\">\n");
      out.write("                                <br>\n");
      out.write("                                \n");
      out.write("                                <label>Telefone:</label>\n");
      out.write("                                ");
      out.print(cliente.getTelefone());
      out.write("\n");
      out.write("                                <br>\n");
      out.write("\n");
      out.write("                                <label>Informações do Veículo:</label> <br>\n");
      out.write("                                ");
      out.print(veiculo.getId());
      out.write(" | ");
      out.print(veiculo.getPlaca());
      out.write(" | ");
      out.print(veiculo.getModelo());
      out.write(" | ");
      out.print(veiculo.getMarca());
      out.write(" | ");
      out.print(veiculo.getCor());
      out.write("\n");
      out.write("                                <input type=\"hidden\" name=\"id_veiculo\" value=\"");
      out.print(veiculo.getId());
      out.write("\">\n");
      out.write("                                <br>\n");
      out.write("                                \n");
      out.write("                                <!-- Mostrar as observações digitadas -->\n");
      out.write("                                <label>Observações:</label> <br>\n");
      out.write("                                <span id=\"observacoesPopUp\"></span>\n");
      out.write("                                \n");
      out.write("                                <br>\n");
      out.write("                                <!-- Mostrar o valor total -->\n");
      out.write("                                <label>Valor Total:</label> <br>\n");
      out.write("                                R$ \n");
      out.write("                                <span id=\"valorTotalPopUp\"></span>\n");
      out.write("                                \n");
      out.write("                                <br>\n");
      out.write("                                <label> Forma de Pagamento: </label> <br>\n");
      out.write("                                ");

                                    for(FormaDePagamento pagamento : list) {
                                        if (pagamento.getServicoPreco().isStatus()) {

                                
      out.write("\n");
      out.write("\n");
      out.write("                                <label>\n");
      out.write("                                    <input type=\"radio\" name=\"id_forma_pagamento\" value=\"");
      out.print(pagamento.getServicoPreco().getId());
      out.write("\" checked>\n");
      out.write("                                    ");
      out.print(pagamento.getServicoPreco().getNome());
      out.write("\n");
      out.write("                                </label>\n");
      out.write("\n");
      out.write("                                ");

                                        }
                                    }
                                
      out.write("                                \n");
      out.write("                            \n");
      out.write("                            <br>\n");
      out.write("                            \n");
      out.write("                            <label> Situação do Pagamento: </label> <br>\n");
      out.write("                            <label>\n");
      out.write("                                <input type=\"radio\" name=\"statusPagamento\" value=\"true\" checked> Em aberto\n");
      out.write("                            </label>\n");
      out.write("\n");
      out.write("                            <label>\n");
      out.write("                                <input type=\"radio\" name=\"statusPagamento\" value=\"false\"> Pago \n");
      out.write("                            </label>\n");
      out.write("                            \n");
      out.write("                            <br>\n");
      out.write("                            \n");
      out.write("                            <label> Responsável pelo Atendimento </label> <br>\n");
      out.write("                            <label> Colaborador(a): </label>\n");
      out.write("                            <select name=\"id_funcionario\" class=\"adicional\">\n");
      out.write("                                <option value=\"\" selected>Escolha um nome</option>\n");
      out.write("                            ");

                                for(Funcionario funcionario : lista) {
                                    if (funcionario.getPessoa().isStatus() && (funcionario.getPerfil().getId_perfil()== 22)) {
                            
      out.write("\n");
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(funcionario.getPessoa().getId());
      out.write('"');
      out.write('>');
      out.print(funcionario.getApelido());
      out.write("</option>    \n");
      out.write("\n");
      out.write("                            ");

                                    }
                                }
                            
      out.write("\n");
      out.write("                            </select>\n");
      out.write("\n");
      out.write("                            <div class=\"botao-salvar-formulario\">\n");
      out.write("                                <button type=\"submit\" value=\"Salvar\" class=\"botao-salvar\">Salvar</button>\n");
      out.write("                            </div>\n");
      out.write("                            </form>\n");
      out.write("                                ");

                                            funcionarioDB.desconectar();
                                            veiculoDB.desconectar();
                                            clienteDB.desconectar();
                                            precoDB.desconectar();
                                            tipoPagamento.desconectar();
                                            
                                        } catch (Exception erro) {
                                            out.print(erro);
                                        }
                                
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    <script src=\"javascript/MostrarPopUpAtendimento.js\"></script>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>       \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
