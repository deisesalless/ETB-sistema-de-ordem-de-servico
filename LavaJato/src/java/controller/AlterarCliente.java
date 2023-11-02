
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
            out.println("<title>Servlet Alterar Cliente</title>");  
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que o usuario digitou no formulario
            int id = Integer.parseInt(request.getParameter("id"));
            String nomeCompleto = request.getParameter("nomeCompleto");
            String telefone = request.getParameter("telefone");
            
            // Verifica se o usuario realmente preencheu todos os campos
            if (nomeCompleto == null || nomeCompleto.equalsIgnoreCase("")) {
                out.print("<script language='javascript'>");
                out.print("alert('O campo Nome Completo deve ser preenchido!');");
                out.print("location.href='listar-cliente.jsp';");
                out.print("</script>");
            } else if (telefone == null || telefone.equalsIgnoreCase("")) {
                out.print("<script language='javascript'>");
                out.print("alert('O campo Telefone deve ser preenchido!');");
                out.print("location.href='listar-cliente.jsp';");
                out.print("</script>");
            } else if (id<1) {
                out.print("<script language='javascript'>");
                out.print("alert('O ID do cliente não foi encontrado!');");
                out.print("location.href='listar-cliente.jsp';");
                out.print("</script>");
            } else {
                
                try {

                    // Instancia um objeto do tipo Cliente
                    Cliente cliente = new Cliente();
                    // Pega as informações do formulário e guarda nos atributos
                    cliente.getPessoa().setId(id);
                    cliente.getPessoa().setNomeCompleto(nomeCompleto);
                    cliente.setTelefone(telefone);
                    
                    // Instancia um objeto do tipo ClienteDAO
                    ClienteDAO clienteBD = new ClienteDAO();
                    // Conecta com o banco de dados e altera as informações
                    // Depois desconeta com o banco de dados
                    clienteBD.conectar();
                    clienteBD.alterar(cliente);
                    clienteBD.desconectar();
                    // Imprime na tela mensagem de sucesso e redireciona o usuario para a pagina listar
                    out.print("<script language='javascript'>");
                    out.print("alert('Cadastro do cliente atualizado com sucesso!');");
                    out.print("location.href='listar-cliente.jsp';");
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
