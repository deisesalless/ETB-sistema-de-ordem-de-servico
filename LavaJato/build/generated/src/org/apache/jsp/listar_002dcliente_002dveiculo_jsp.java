package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DataUtility.DataUtility;
import entidade.Veiculo;
import java.util.List;
import persistencia.VeiculoDAO;
import entidade.Cliente;
import persistencia.ClienteDAO;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import persistencia.UsuarioDAO;
import java.util.ArrayList;
import entidade.Perfil;
import persistencia.PerfilDAO;
import entidade.Usuario;

public final class listar_002dcliente_002dveiculo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Teste de listar cliente e veiculo</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/pagina-inteira.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/banner.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/menu.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"estilo/cliente-veiculo.css\">\n");
      out.write("        <script src=\"javascript/On&Off.js\"></script>\n");
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
      out.write("                    <a href=\"pagina-inicial.jsp\"> Inicio</a> |\n");
      out.write("                    <a href=\"listar-perfil.jsp\"> Perfil</a> |\n");
      out.write("                    <a href=\"listar-usuario.jsp\"> Usuario</a> |\n");
      out.write("                    <a href=\"listar-funcionario.jsp\"> Funcionario</a> |\n");
      out.write("                    <a href=\"listar-tipo-pagamento.jsp\"> Formas de Pagamento</a> |\n");
      out.write("                    <a href=\"listar-tabela-preco.jsp\"> Tabela de Preços</a> |\n");
      out.write("                    <a href=\"listar-cliente-veiculo.jsp\"> Cliente & Veiculo </a> |\n");
      out.write("                <td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write(" \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"principal\">\n");
      out.write("                <div class=\"conteudo\">\n");
      out.write("                    <h3>\n");
      out.write("                        Lista de Clientes e Veiculos\n");
      out.write("                        <button id=\"mostrar-pop-up\">+ Novo</button>\n");
      out.write("                    </h3>\n");
      out.write("                    <div class=\"sanfona\">\n");
      out.write("                        <div class=\"item\">\n");
      out.write("                        ");

                            try {
                                ClienteDAO clienteDB = new ClienteDAO();
                                ArrayList<Cliente> lista;
                                clienteDB.conectar();
                                lista = clienteDB.listar();
                                for(Cliente cliente:lista) {
                       
      out.write("\n");
      out.write("                            <div class=\"nome-cliente\">\n");
      out.write("                                Id: ");
      out.print(cliente.getPessoa().getId());
      out.write(" | Telefone: ");
      out.print(cliente.getTelefone());
      out.write(" | Cliente: ");
      out.print(cliente.getPessoa().getNomeCompleto());
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"veiculo-cliente\">\n");
      out.write("                            ");

                                try {
                                    VeiculoDAO veiculoDB = new VeiculoDAO();
                                    List<Veiculo> list;
                                    veiculoDB.conectar();
                                    list = veiculoDB.listar();
                                    veiculoDB.desconectar();
                                    for(Veiculo veic:list) {
                                        if (veic.getCliente().getPessoa().getId() == cliente.getPessoa().getId()) {
                            
      out.write("\n");
      out.write("                                <table width=\"1200\" border=\"1\">\n");
      out.write("                                    <tr bgcolor=\"#d3d3d3\">\n");
      out.write("                                        <td>ID cliente</td>\n");
      out.write("                                        <td>Placa</td>\n");
      out.write("                                        <td>Cor</td>\n");
      out.write("                                        <td>Marca</td>\n");
      out.write("                                        <td>Modelo</td>\n");
      out.write("                                        <td>Alterar</td>\n");
      out.write("                                        <td>Novo Veiculo</td>\n");
      out.write("                                        <td>Atendimento</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>");
      out.print(veic.getCliente().getPessoa().getId());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(veic.getPlaca());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(veic.getCor());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(veic.getMarca());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(veic.getModelo());
      out.write("</td>\n");
      out.write("                                        <td align=\"center\">\n");
      out.write("                                            <button>\n");
      out.write("                                                <a href=\"teste.jsp?id=");
      out.print(veic.getId());
      out.write("\">\n");
      out.write("                                                    alterar\n");
      out.write("                                                </a> \n");
      out.write("                                            </button>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td align=\"center\">\n");
      out.write("                                            <button>\n");
      out.write("                                                <a href=\"form-cadastrar-veiculo.jsp?id=");
      out.print(cliente.getPessoa().getId());
      out.write("\">\n");
      out.write("                                                    adicionar\n");
      out.write("                                                </a> \n");
      out.write("                                            </button>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td align=\"center\">\n");
      out.write("                                            <button>\n");
      out.write("                                                <a href=\"form-cadastrar-atendimento.jsp?id=");
      out.print(cliente.getPessoa().getId());
      out.write("\">\n");
      out.write("                                                    adicionar\n");
      out.write("                                                </a> \n");
      out.write("                                            </button>\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </table>\n");
      out.write("                                ");

                                            }
                                        }
                                        veiculoDB.desconectar();
                                    } catch (Exception erro) {
                                        out.print(erro);
                                    }
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        ");

                                }
                                clienteDB.desconectar();
                            } catch (Exception erro) {
                                out.print(erro);
                            }
                        
      out.write("   \n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <script>\n");
      out.write("                            const accordion = document.getElementsByClassName('item');\n");
      out.write("\n");
      out.write("                            for (i = 0; i < accordion.length; i++){\n");
      out.write("                                accordion[i].addEventListener('click', function() {\n");
      out.write("                                    this.classList.toggle('ativo')\n");
      out.write("                                })\n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"pop-up\"> \n");
      out.write("                    <div class=\"botao-fechar\">&times;</div>\n");
      out.write("                        <div class=\"formulario\">\n");
      out.write("                            <h3>Cadastrar Cliente & Veiculo</h3>\n");
      out.write("                            <script>\n");
      out.write("                                function validaForm(){\n");
      out.write("                                    formulario = document.form_cadastrar_cliente_veiculo;\n");
      out.write("                                    if(formulario.nomeCompleto.value===\"\"){\n");
      out.write("                                        alert(\"O campo Nome deve ser preenchido!\");\n");
      out.write("                                        formulario.nomeCompleto.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.telefone.value===\"\"){\n");
      out.write("                                        alert(\"O campo Telefone deve ser preenchido!\");\n");
      out.write("                                        formulario.telefone.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.dataCadastro.value===\"\"){\n");
      out.write("                                        alert(\"O campo Data deve ser preenchido!\");\n");
      out.write("                                        formulario.dataCadastro.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.placa.value===\"\"){\n");
      out.write("                                        alert(\"O campo Placa deve ser preenchido!\");\n");
      out.write("                                        formulario.placa.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.cor.value===\"\"){\n");
      out.write("                                        alert(\"O campo Cor deve ser preenchido!\");\n");
      out.write("                                        formulario.cor.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.marca.value===\"\"){\n");
      out.write("                                        alert(\"O campo Marca deve ser preenchido!\");\n");
      out.write("                                        formulario.marca.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    if(formulario.id_cliente.value===\"\"){\n");
      out.write("                                        alert(\"O ID do cliente deve ser preenchido!\");\n");
      out.write("                                        formulario.id_cliente.focus();\n");
      out.write("                                        return false;\n");
      out.write("                                    }\n");
      out.write("                                    return true;\n");
      out.write("                                }\n");
      out.write("                            </script>\n");
      out.write("                            <form name=\"form_cadastrar_cliente_veiculo\" action=\"cadastrar_cliente_veiculo.do\" method=\"post\" onsubmit=\"return validaForm();\">\n");
      out.write("\n");
      out.write("                                <label>Nome Completo:</label>\n");
      out.write("                                <input type=\"text\" name=\"nomeCompleto\" placeholder=\"Digite o nome completo\" size=\"30\">\n");
      out.write("\n");
      out.write("                                <label>Telefone:</label>\n");
      out.write("                                <input type=\"text\" name=\"telefone\" placeholder=\"Digite o telefone\" size=\"30\">\n");
      out.write("                                \n");
      out.write("                                <label>Marca do veículo:</label>\n");
      out.write("                                <input type=\"text\" name=\"marca\" placeholder=\"Digite a marca do veículo\" size=\"30\">\n");
      out.write("                                \n");
      out.write("                                <label>Modelo do veículo:</label>\n");
      out.write("                                <input type=\"text\" name=\"modelo\" placeholder=\"Digite o modelo do veículo\" size=\"30\">\n");
      out.write("\n");
      out.write("                                <label>Cor do veículo:</label>\n");
      out.write("                                <input type=\"text\" name=\"cor\" placeholder=\"Digite a cor do veículo\" size=\"30\">\n");
      out.write("\n");
      out.write("                                <label>Placa do veículo:</label>\n");
      out.write("                                <input type=\"text\" name=\"placa\" placeholder=\"Digite a placa do veículo\" size=\"30\">\n");
      out.write("                                \n");
      out.write("                                <div class=\"botao-salvar-formulario\">\n");
      out.write("                                    <button type=\"submit\" value=\"Salvar\" class=\"botao-salvar\">Salvar</button>\n");
      out.write("                                </div>\n");
      out.write("                            </form> \n");
      out.write("                        </div>\n");
      out.write("                    <script>\n");
      out.write("                        // Comando para mostrar o Pop-up utilizando JavaScript\n");
      out.write("                        document.querySelector(\"#mostrar-pop-up\").addEventListener(\"click\", function() {\n");
      out.write("                            document.querySelector(\"#pop-up\").classList.add(\"ativo\");\n");
      out.write("                            document.querySelector(\"#overlay\").style.display = \"block\";\n");
      out.write("                        });\n");
      out.write("\n");
      out.write("                        // Comando para fechar o Pop-up utilizando JavaScript\n");
      out.write("                        document.querySelector(\"#pop-up .botao-fechar\").addEventListener(\"click\", function() {\n");
      out.write("                            document.querySelector(\"#pop-up\").classList.remove(\"ativo\");\n");
      out.write("                             document.querySelector(\"#overlay\").style.display = \"none\";\n");
      out.write("                        });\n");
      out.write("                    </script>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
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
