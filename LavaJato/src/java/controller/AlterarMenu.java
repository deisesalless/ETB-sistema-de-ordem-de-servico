
package controller;

import entidade.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.MenuDAO;

@WebServlet(name = "AlterarMenu", urlPatterns = {"/AlterarMenu"})
public class AlterarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Menu</title>");
            out.println("</head>");
            out.println("<body>");

            int id_menu = Integer.parseInt(request.getParameter("id_menu"));
            String menu = request.getParameter("menu");
            String link = request.getParameter("link");
            
            
            if (id_menu <= 0) {
                out.print("O ID do Menu não foi encontrado!");
                
            } else if (menu.equals("") || link.equals("")) {
                out.print("O campo Perfil deve ser preenchido!");
                
            } else {
                try {
                    Menu m = new Menu();
                    m.setId_menu(id_menu);
                    m.setMenu(menu);
                    m.setLink(link);

                    MenuDAO mDB = new MenuDAO();
                    mDB.conectar();
                    mDB.alterar(m);
                    mDB.desconectar();

                    out.print("<script language='javascript'>");
                    out.print("alert('Menu alterado com sucesso!!');");
                    out.print("location.href='listar-menu.jsp';");
                    out.print("</script>");

                } catch (Exception erro) {
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