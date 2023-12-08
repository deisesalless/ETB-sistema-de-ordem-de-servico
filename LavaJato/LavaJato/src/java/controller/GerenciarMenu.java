
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.PerfilDAO;

@WebServlet(name = "GerenciarMenu", urlPatterns = {"/GerenciarMenu"})
public class GerenciarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Gerenciar Menu Perfil</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                String op = request.getParameter("op");
                int id_menu = Integer.parseInt(request.getParameter("id_menu"));
                int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));

                PerfilDAO pDB = new PerfilDAO();
                pDB.conectar();
                

                if (op.equals("vincular")) {
                    pDB.vincularMenu(id_menu, id_perfil);
                } else if (op.equals("desvincular")) {
                    pDB.desvincularMenu(id_menu, id_perfil);

                }
                pDB.desconectar();
                out.print("<script language='javascript'>");
                out.print("location.href='form-gerenciar-perfil-menu.jsp?id_perfil="+id_perfil+"';");
                out.print("</script>");

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

