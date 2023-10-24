
package controller;

import entidade.Perfil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.PerfilDAO;

@WebServlet(name = "CadastrarPerfil", urlPatterns = {"/CadastrarPerfil"})
public class CadastrarPerfil extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Perfil</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do perfil
            String perfil = request.getParameter("nome");
            
            // Verifica se os campos foram devidamente preenchidos
            if (perfil == null || perfil.equalsIgnoreCase("")) {
                out.print("O campo perfil deve ser preenchido!");
            } else {
                try {
                    // Instancia um objeto do tipo Perfil e armazena as informações que foram digitadas
                    Perfil perfils = new Perfil();
                    perfils.setNome(perfil);
                    
                    // Instancia um objeto do tipo PerfilDAO, recebe as informações do objeto FPerfil e inclui no Banco de Dados
                    PerfilDAO perfilDB = new PerfilDAO();
                    perfilDB.conectar();
                    perfilDB.cadastrar(perfils);
                    perfilDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Perfil cadastrado com sucesso!!');");
                    out.print("location.href='listar-perfil.jsp';");
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