
package controller;

import entidade.TabelaPreco;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.TabelaPrecoDAO;

@WebServlet(name = "CadastrarTabelaPreco", urlPatterns = {"/CadastrarTabelaPreco"})
public class CadastrarTabelaPreco extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Tabela Preco</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario
            String nome = request.getParameter("nome");
            String precoVeiculoPequeno = request.getParameter("precoVeiculoPequeno");
            String precoVeiculoMedio = request.getParameter("precoVeiculoMedio");
            String precoVeiculoGrande = request.getParameter("precoVeiculoGrande");

            // Verifica se os campos foram devidamente preenchidos
            if (nome == null || nome.equalsIgnoreCase("")) {
                out.print("O campo Nome do Serviço deve ser preenchido!");
            } else if (precoVeiculoPequeno == null || precoVeiculoPequeno.equalsIgnoreCase("")) {
                out.print("O campo Preço Veículo Pequeno deve ser preenchido!");
            } else if (precoVeiculoMedio == null || precoVeiculoMedio.equalsIgnoreCase("")) {
                out.print("O campo Preço Veículo Médio deve ser preenchido!");
            } else if (precoVeiculoGrande == null || precoVeiculoGrande.equalsIgnoreCase("")) {
                out.print("O campo Preço Veículo Grande deve ser preenchido!");
            } else {
                

                try {
                    // Formata o preco retirando a virgula e colocando ponto
                    precoVeiculoPequeno = precoVeiculoPequeno.replace(',', '.');
                    precoVeiculoMedio = precoVeiculoMedio.replace(',', '.');
                    precoVeiculoGrande = precoVeiculoGrande.replace(',', '.');
                    
                    // Instancia um objeto do tipo TabelaPreco e armazena as informações que foram digitadas
                    TabelaPreco tabelaPrecoo = new TabelaPreco();
                    tabelaPrecoo.setNome(nome);
                    tabelaPrecoo.setPrecoVeiculoPequeno(Double.parseDouble(precoVeiculoPequeno));
                    tabelaPrecoo.setPrecoVeiculoMedio(Double.parseDouble(precoVeiculoMedio));
                    tabelaPrecoo.setPrecoVeiculoGrande(Double.parseDouble(precoVeiculoGrande));
                    
                    // Instancia um objeto do tipo TabelaPrecoDAO, recebe as informações
                    // do objeto TabelaPreco e inclui no Banco de Dados
                    TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
                    tabelaPrecoDB.conectar();
                    tabelaPrecoDB.cadastrar(tabelaPrecoo);
                    tabelaPrecoDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Novo serviço/preço incluído com sucesso!');");
                    out.print("location.href='listar-tabela-preco.jsp';");
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
