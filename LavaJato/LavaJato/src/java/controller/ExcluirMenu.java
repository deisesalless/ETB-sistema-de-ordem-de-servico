package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entidade.Menu;
import javax.servlet.annotation.WebServlet;
import persistencia.MenuDAO;

@WebServlet(name = "ExcluirMenu", urlPatterns = {"/ExcluirMenu"})
public class ExcluirMenu extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Menu</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String id_menu = request.getParameter("id_menu");
            
            if (id_menu == null || id_menu.equals("")) {
                
                out.print("Um MENU deve ser selecionado!");
                
            } else {
                try {
                    Menu m = new Menu();
                    m.setId_menu(Integer.parseInt(id_menu));
                    
                    MenuDAO mDB = new MenuDAO();
                    mDB.conectar();
                    mDB.excluir(m);
                    mDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Menu excluído com sucesso!!');");
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
