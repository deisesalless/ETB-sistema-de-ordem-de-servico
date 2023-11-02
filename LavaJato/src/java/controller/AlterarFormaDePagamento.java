
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

@WebServlet(name = "AlterarFormaDePagamento", urlPatterns = {"/AlterarFormaDePagamento"})
public class AlterarFormaDePagamento extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Forma De Pagamento</title>");  
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que o usuario digitou no formulario
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");

            
            // Verifica se os campos foram devidamente preenchidos
            if (nome == null || nome.equalsIgnoreCase("")) {
                out.print("O campo Tipo De Pagamento deve ser preenchido!");
            } else {
                
                try {

                    // Instancia objeto do tipo Forma De Pagamento e armazena as informações que foram digitadas
                    FormaDePagamento formPagamento = new FormaDePagamento();
                    formPagamento.getServicoPreco().setId(id);
                    formPagamento.getServicoPreco().setNome(nome);
                    
                    // Instancia um objeto do tipo FormaDePagamentoDAO, recebe as informações do objeto
                    // Forma De Pagamento e inclui no Banco de Dados
                    FormaDePagamentoDAO formPagamentoBD = new FormaDePagamentoDAO();
                    formPagamentoBD.conectar();
                    formPagamentoBD.alterar(formPagamento);
                    formPagamentoBD.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Forma de Pagamento atualizado com sucesso!');");
                    out.print("location.href='listar-tipo-pagamento.jsp';");
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
