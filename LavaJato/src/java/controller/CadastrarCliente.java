
package controller;

import DataUtility.DataUtility;
import entidade.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.ClienteDAO;

@WebServlet(name = "CadastrarCliente", urlPatterns = {"/CadastrarCliente"})
public class CadastrarCliente extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Cliente</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do funcionario
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String telefone = request.getParameter("telefone");
            String dataCadastro = request.getParameter("dataCadastro");

            // Verifica se os campos foram devidamente preenchidos
            if (nome == null || nome.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
            } else if (sobrenome == null || sobrenome.equalsIgnoreCase("")) {
                out.print("O campo Sobrenome deve ser preenchido!");
            } else if (telefone == null || telefone.equalsIgnoreCase("")) {
                out.print("O campo Telefone deve ser preenchido!");
            } else if (dataCadastro == null || dataCadastro.equalsIgnoreCase("")) {
                out.print("O campo Data do Cadastro deve ser preenchido!");
            } else {
                

                try {
                    // Instancia um objeto do tipo Cliente e armazena as informações que foram digitadas
                    Cliente cliente = new Cliente();
                    cliente.getPessoa().setNome(nome);
                    cliente.getPessoa().setSobrenome(sobrenome);
                    cliente.setTelefone(telefone);
                    // Muda o formado de String para data
                    cliente.getPessoa().setDataCadastro(DataUtility.stringToDate(dataCadastro));
                    
                    // Instancia um objeto do tipo ClienteDAO, recebe as informações do objeto Cliente e inclui no Banco de Dados
                    ClienteDAO clienteBD = new ClienteDAO();
                    clienteBD.conectar();
                    clienteBD.cadastrar(cliente);
                    clienteBD.desconectar();

                    out.print("<script language='javascript'>");
                    out.print("alert('Cliente cadastrado com sucesso!');");
                    out.print("window.location.href='form-cadastrar-veiculo.jsp?id_cliente=" + cliente.getIdGerado() + "';");
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