
package controller;

import entidade.Atendimento;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.AtendimentoDAO;


@WebServlet(name = "PagarAtendimento", urlPatterns = {"/PagarAtendimento"})
public class PagarAtendimento extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PagarAtendimento</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações
            int id = Integer.parseInt(request.getParameter("id"));
            boolean statusPagamento = Boolean.parseBoolean(request.getParameter("statusPagamento"));
            
                try {
                    
                    Atendimento atendimento = new Atendimento();
                    atendimento.setId(id);
                    atendimento.setStatusPagamento(statusPagamento);
                    
                    AtendimentoDAO atendimentoBD = new AtendimentoDAO();
                    atendimentoBD.conectar();
                    atendimentoBD.pagarAtendimento(atendimento);
                    atendimentoBD.desconectar();
                    
                    response.sendRedirect("listar-atendimento.jsp");
                    
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