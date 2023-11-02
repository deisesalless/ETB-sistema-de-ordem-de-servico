
package controller;

import DataUtility.DataUtility;
import entidade.Empresa;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.EmpresaDAO;

@WebServlet(name = "CadastrarEmpresa", urlPatterns = {"/CadastrarEmpresa"})
public class CadastrarEmpresa extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Empresa</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario da empresa
            String cnpj = request.getParameter("cnpj");
            String razaoSocial = request.getParameter("razaoSocial");
            String nomeFantasia = request.getParameter("nomeFantasia");
            String responsavel = request.getParameter("responsavel");
            String dataCadastro = request.getParameter("dataCadastro");

            // Verifica se os campos foram devidamente preenchidos
            if (cnpj == null || cnpj.equalsIgnoreCase("")) {
                out.print("O campo CNPJ deve ser preenchido!");
            } else if (razaoSocial == null || razaoSocial.equalsIgnoreCase("")) {
                out.print("O campo Razão Social deve ser preenchido!");
            } else if (nomeFantasia == null || nomeFantasia.equalsIgnoreCase("")) {
                out.print("O campo Nome Fantasia deve ser preenchido!");
            } else if (responsavel == null || responsavel.equalsIgnoreCase("")) {
                out.print("O campo Responsável deve ser preenchido!");
            } else if (dataCadastro == null || dataCadastro.equalsIgnoreCase("")) {
                out.print("O campo Data do Cadastro deve ser preenchido!");
            } else {
                

                try {
                    // Instancia um objeto do tipo Empresa e armazena as informações que foram digitadas
                    Empresa empresaa = new Empresa();
                    empresaa.setCnpj(cnpj);
                    empresaa.setRazaoSocial(razaoSocial);
                    empresaa.setNomeFantasia(nomeFantasia);
                    empresaa.setResponsavel(responsavel);
                    // Muda o formado de String para data
                    empresaa.setDataCadastro(DataUtility.stringToDate(dataCadastro));
                    
                    // Instancia um objeto do tipo EmpresaDAO, recebe as informações do objeto Empresa e inclui no Banco de Dados
                    EmpresaDAO empresaDB = new EmpresaDAO();
                    empresaDB.conectar();
                    empresaDB.cadastrar(empresaa);
                    empresaDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Empresa inserida com sucesso!!');");
                    out.print("location.href='listar-empresa.jsp';");
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
