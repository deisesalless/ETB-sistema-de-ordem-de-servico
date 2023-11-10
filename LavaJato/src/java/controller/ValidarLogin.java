
package controller;

import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistencia.UsuarioDAO;

@WebServlet(name = "ValidarLogin", urlPatterns = {"/ValidarLogin"})
public class ValidarLogin extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Validar e Efetuar Login</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Cria um objeto que vai direcionar o usuario caso consiga fazer o login
            HttpSession session = request.getSession();
            
            // Recebe as informações que o usuario digitou na tela
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
           
                try {
                    // Utiliza o método validarLogin do UsuarioDAO
                    UsuarioDAO uDB = new UsuarioDAO();
                    uDB.conectar();
                    Usuario usuario = uDB.validarLogin(login, senha);
                    uDB.desconectar();
                                        
                    // Verifica se o identificador do login é maior que 0
                    if (usuario.getPessoa().getId() > 0) {
                        session.setAttribute("usuario", usuario);
                        response.sendRedirect("pagina-inicial.jsp");

                    } else {
                        out.print("<script language='javascript'>");
                        out.print("alert('Usuario ou Senha inválidos!');");
                        out.print("location.href='index.jsp';");
                        out.print("</script>");
                    }
                
                } catch (Exception e) {
                    out.print(e);
                } 
                out.println("</body>");
                out.println("</html>");
                
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
