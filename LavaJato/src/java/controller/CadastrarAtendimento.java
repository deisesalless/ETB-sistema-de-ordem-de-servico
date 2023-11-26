
package controller;

import DataUtility.DataUtility;
import entidade.Atendimento;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.AtendimentoDAO;


@WebServlet(name = "CadastrarAtendimento", urlPatterns = {"/CadastrarAtendimento"})
public class CadastrarAtendimento extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Atendimento</title>");
            out.println("</head>");
            out.println("<body>");

            // Aqui preciso receber a String observacao e repassar para o Java
            String observacao = request.getParameter("observacao");
            // Aqui preciso receber a String valorTotal e repassar para o Java
            String valorTotal = request.getParameter("valorTotal");
            
            
            String data = request.getParameter("data");
            String status_pagamento = request.getParameter("statusPagamento");            
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
            int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
            int id_forma_pagamento = Integer.parseInt(request.getParameter("id_forma_pagamento"));
            
            
            if (observacao == null || observacao.equalsIgnoreCase("")) {
                out.print("Nao foi incluido observacoes para este atendimento. valor: " + observacao); 

                
            } else if (valorTotal == null || valorTotal.equalsIgnoreCase("")) {
                out.print("O valor total do serviço está em branco. valor: " + valorTotal);
                
                
            } else if (data == null || data.equalsIgnoreCase("")) {
                out.print("O campo Data está com erro para reconhecer a data do sistema!");                    
            } else if (status_pagamento == null || status_pagamento.equalsIgnoreCase("")) {
                out.print("O campo Status do Pagamento deve ser preenchido!");
            } else if (id_usuario < 0) {
                out.print("ID do Usuario não encontrado!");
            } else if (id_cliente > 0) {
                out.print("ID do Cliente não encontrado!");
            } else if (id_veiculo > 0) {
                out.print("ID do Veiculo não encontrado!");
            } else if (id_funcionario > 0) {
                out.print("ID do Funcionario(a) não encontrado!");
            } else if (id_forma_pagamento > 0) {
                out.print("ID da Forma de Pagamento não encontrado!");    
            

            } else {
            
                try {
                    
                    valorTotal = valorTotal.replace(',', '.');
                    
                    AtendimentoDAO atendimentoBD = new AtendimentoDAO();
                    atendimentoBD.conectar();
                    
                    Atendimento atendimento = new Atendimento();
                    atendimento.setData(DataUtility.stringToDate(data));
                    atendimento.setStatusPagamento(Boolean.parseBoolean(status_pagamento));
                    atendimento.setPrecoTotal(Double.parseDouble(valorTotal));
                    atendimento.getUsuario().getPessoa().setId(id_usuario);
                    atendimento.getCliente().getPessoa().setId(id_cliente);
                    atendimento.getVeiculo().setId(id_veiculo);
                    atendimento.getFuncionario().getPessoa().setId(id_funcionario);
                    atendimento.getFormaDePagamento().getServicoPreco().setId(id_forma_pagamento);
                    
                    atendimentoBD.cadastrar(atendimento);
                    atendimentoBD.desconectar();
 
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
