
package controller;

import entidade.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.ClienteDAO;

@WebServlet(name = "AlterarCliente", urlPatterns = {"/AlterarCliente"})
public class AlterarCliente extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Cliente </title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do funcionario
            int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            String nomeCompleto = request.getParameter("nomeCompleto");
            String telefone = request.getParameter("telefone");

            // Verifica se os campos foram devidamente preenchidos
            if (nomeCompleto == null || nomeCompleto.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
                
            } else if (telefone == null || telefone.equalsIgnoreCase("")) {
                out.print("O campo Telefone deve ser preenchido!");
                
            } else if (id_cliente < 1) {
                out.print("O ID do cliente não foi encontrado!");
                
            } else {
                
                try {

                    Cliente cliente = new Cliente();
                    cliente.getPessoa().setId(id_cliente);
                    cliente.getPessoa().setNomeCompleto(nomeCompleto);
                    cliente.setTelefone(telefone);                   
                    
                    ClienteDAO clienteBD = new ClienteDAO();
                    clienteBD.alterar(cliente);
                    clienteBD.desconectar();


                    out.print("<script language='javascript'>");
                    out.print("alert('Cliente atualizado com sucesso!');");
                    out.print("location.href='listar-cliente-veiculo.jsp';");
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
