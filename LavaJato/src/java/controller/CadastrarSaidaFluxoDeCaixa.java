
package controller;

import entidade.FluxoDeCaixa;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.FluxoDeCaixaDAO;

@WebServlet(name = "CadastrarSaidaFluxoDeCaixa", urlPatterns = {"/CadastrarSaidaFluxoDeCaixa"})
public class CadastrarSaidaFluxoDeCaixa extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Saida do Fluxo De Caixa</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario
            String data = request.getParameter("data");
            String nome = request.getParameter("nome");
            String valor = request.getParameter("valor");

            // Verifica se os campos foram devidamente preenchidos
            if (data == null || data.equalsIgnoreCase("")){
                out.print("O campo Data está com erro para reconhecer a data do sistema!");
                
            } else if (nome == null || nome.equalsIgnoreCase("")) {
                out.print("O campo Nome deve ser preenchido!");
                
            } else if (valor == null || valor.equalsIgnoreCase("")) {
                out.print("O campo Valor deve ser preenchido!");
                
            } else {
                

                try {
                    // Formata o preco retirando a virgula e colocando ponto
                    valor = valor.replace(',', '.');
                    
                    // Instancia um objeto do tipo TabelaPreco e armazena as informações que foram digitadas
                    FluxoDeCaixa fluxoDeCaixa = new FluxoDeCaixa();
                    
                    // Define o formato esperado da String
                    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    Date dataFormatada = formato.parse(data);
                    fluxoDeCaixa.setData(dataFormatada);
                    
                    fluxoDeCaixa.setDescricao(nome);
                    fluxoDeCaixa.setValor(Double.parseDouble(valor));
                    
                    // Instancia um objeto do tipo TabelaPrecoDAO, recebe as informações
                    // do objeto TabelaPreco e inclui no Banco de Dados
                    FluxoDeCaixaDAO fluxoDeCaixaDB = new FluxoDeCaixaDAO();
                    fluxoDeCaixaDB.conectar();
                    fluxoDeCaixaDB.cadastrar(fluxoDeCaixa);
                    fluxoDeCaixaDB.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Novo valor de saída cadastrado com sucesso!');");
                    out.print("location.href='listar-saida-caixa.jsp';");
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
