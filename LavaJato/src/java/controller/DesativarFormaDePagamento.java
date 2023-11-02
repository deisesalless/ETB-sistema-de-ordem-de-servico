
package controller;

import entidade.FormaDePagamento;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.FormaDePagamentoDAO;

@WebServlet(name = "DesativarFormaDePagamento", urlPatterns = {"/DesativarFormaDePagamento"})
public class DesativarFormaDePagamento extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Desativar Forma De Pagamento</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações
            int id = Integer.parseInt(request.getParameter("id"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            
                try {
                    
                    FormaDePagamento formaDePagamento = new FormaDePagamento();
                    formaDePagamento.getServicoPreco().setId(id);
                    formaDePagamento.getServicoPreco().setStatus(status);
                    
                    FormaDePagamentoDAO formaDePagamentoBD = new FormaDePagamentoDAO();
                    formaDePagamentoBD.conectar();
                    formaDePagamentoBD.desativar(formaDePagamento);
                    formaDePagamentoBD.desconectar();
                    
                    response.sendRedirect("listar-tipo-pagamento.jsp");
                    
                } catch (Exception erro) {
                    
                    out.print(erro);
                }
            
        } finally {
            out.close();
        }
        
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
