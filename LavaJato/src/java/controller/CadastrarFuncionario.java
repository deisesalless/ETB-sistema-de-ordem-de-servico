
package controller;

import DataUtility.DataUtility;
import entidade.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.FuncionarioDAO;

@WebServlet(name = "CadastrarFuncionario", urlPatterns = {"/CadastrarFuncionario"})
public class CadastrarFuncionario extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Funcionario</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do funcionario
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String apelido = request.getParameter("apelido");
            String telefone = request.getParameter("telefone");
            String dataCadastro = request.getParameter("dataCadastro");
            // Converte de String para int
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));

            // Verifica se os campos foram devidamente preenchidos
            if (nome == null || nome.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
            } else if (sobrenome == null || sobrenome.equalsIgnoreCase("")) {
                out.print("O campo Sobrenome deve ser preenchido!");
            } else if (apelido == null || apelido.equalsIgnoreCase("")) {
                out.print("O campo Apelido deve ser preenchido!");
            } else if (telefone == null || telefone.equalsIgnoreCase("")) {
                out.print("O campo Telefone deve ser preenchido!");
            } else if (dataCadastro == null || dataCadastro.equalsIgnoreCase("")) {
                out.print("O campo Data do Cadastro deve ser preenchido!");
            } else if (id_perfil<1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else {
                

                try {
                    // Instancia objeto do tipo Funcionario e armazena as informações que foram digitadas
                    Funcionario funcionarioo = new Funcionario();
                    funcionarioo.getPessoa().setNome(nome);
                    funcionarioo.getPessoa().setSobrenome(sobrenome);
                    funcionarioo.setApelido(apelido);
                    funcionarioo.setTelefone(telefone);
                    // Muda o formado de String para data
                    funcionarioo.getPessoa().setDataCadastro(DataUtility.stringToDate(dataCadastro));
                    funcionarioo.getPerfil().setId(id_perfil);
                    
                    // Instancia um objeto do tipo FuncionarioDAO, recebe as informações do objeto Funcionario e inclui no Banco de Dados
                    FuncionarioDAO funcionarioDB = new FuncionarioDAO();
                    funcionarioDB.conectar();
                    funcionarioDB.cadastrar(funcionarioo);
                    funcionarioDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Funcionario cadastrado com sucesso!');");
                    out.print("location.href='listar-funcionario.jsp';");
                    out.print("</script>");
                } catch (Exception erro) {
                    // Se não conseguir incluir irá mostrar o erro
                    out.print(erro);
                }

            }

            out.println("</body>");
            out.println("</html>");


        } finally { 
            out.close();
        }
    } 

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}