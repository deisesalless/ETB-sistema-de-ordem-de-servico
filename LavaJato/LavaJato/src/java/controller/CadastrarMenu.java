
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

@WebServlet(name = "CadastrarMenu", urlPatterns = {"/CadastrarMenu"})
public class CadastrarMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Menu</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String m = request.getParameter("menu");
            String link = request.getParameter("link");
            
            if (m.equals("") || link.equals("")) {
                out.print("Campos obrigatórios devem ser preenchidos!");
                
            } else {
                try {
                    
                    Menu menu = new Menu();
                    menu.setMenu(m);
                    menu.setLink(link);
                    
                    MenuDAO mDB = new MenuDAO();
                    mDB.conectar();
                    mDB.cadastrar(menu);
                    mDB.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Menu inserido com sucesso!!');");
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
