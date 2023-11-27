
package controller;

import DataUtility.DataUtility;
import entidade.Atendimento;
import entidade.Cliente;
import entidade.FormaDePagamento;
import entidade.Funcionario;
import entidade.Usuario;
import entidade.Veiculo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.AtendimentoDAO;
import persistencia.ClienteDAO;
import persistencia.FormaDePagamentoDAO;
import persistencia.FuncionarioDAO;
import persistencia.UsuarioDAO;
import persistencia.VeiculoDAO;


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
            
            
            String data = request.getParameter("data");
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
            String observacao = request.getParameter("observacao");
            String valorTotal = request.getParameter("valorTotal");
            int id_forma_pagamento = Integer.parseInt(request.getParameter("id_forma_pagamento"));
            String status_pagamento = request.getParameter("statusPagamento");  
            int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));


            
            if (data == null || data.equalsIgnoreCase("")) {
                out.print("O campo DATA está com erro para reconhecer a data do sistema!");
                
            } else if (id_usuario < 0) {
                out.print("ID do Usuario não encontrado!");
                
            } else if (id_cliente < 0) {
                out.print("ID do Cliente não encontrado!");
                
            } else if (id_veiculo < 0) {
                out.print("ID do Veiculo não encontrado!");
            
            } else if (observacao == null || observacao.equalsIgnoreCase("")) {
                out.print("Não foi incluido observacoes para este atendimento");
                
            } else if (valorTotal == null || valorTotal.equalsIgnoreCase("")) {
                out.print("O valor total do serviço está em branco.");
                
            } else if (id_forma_pagamento < 0) {
                out.print("ID da Forma de Pagamento não encontrado!");   

                
            } else if (status_pagamento == null || status_pagamento.equalsIgnoreCase("")) {
                out.print("O campo Status do Pagamento deve ser preenchido!");

            } else if (id_funcionario < 0) {
                out.print("ID do Funcionario(a) não encontrado!");

            } else {
            
                try {
                    
                    valorTotal = valorTotal.replace(',', '.');
                    
                    AtendimentoDAO atendimentoBD = new AtendimentoDAO();
                    UsuarioDAO usuarioBD = new UsuarioDAO();
                    ClienteDAO clienteBD = new ClienteDAO();
                    VeiculoDAO veiculoBD = new VeiculoDAO();
                    FuncionarioDAO funcionarioBD = new FuncionarioDAO();
                    FormaDePagamentoDAO formaDePagamentoBD = new FormaDePagamentoDAO();
                    
                    atendimentoBD.conectar();
                    usuarioBD.conectar();
                    clienteBD.conectar();
                    veiculoBD.conectar();
                    funcionarioBD.conectar();
                    formaDePagamentoBD.conectar();
                    
                    Atendimento atendimento = new Atendimento();
                    atendimento.setData(DataUtility.stringToDate(data));
                    atendimento.setStatusPagamento(Boolean.parseBoolean(status_pagamento));
                    atendimento.setValorTotal(Double.parseDouble(valorTotal));
                    atendimento.setObservacao(observacao);
                    
                    // Erro aqui a classe atendimento getPessoa cai na exceção do trycath
                    atendimento.getUsuario().getPessoa().setId(id_usuario);
                    atendimento.getCliente().getPessoa().setId(id_cliente);
                    atendimento.getVeiculo().setId(id_veiculo);
                    atendimento.getFuncionario().getPessoa().setId(id_funcionario);
                    atendimento.getFormaDePagamento().getServicoPreco().setId(id_forma_pagamento);
                    
                    atendimentoBD.cadastrar(atendimento);
                    
                    atendimentoBD.desconectar();
                    usuarioBD.desconectar();
                    clienteBD.desconectar();
                    veiculoBD.desconectar();
                    funcionarioBD.desconectar();
                    formaDePagamentoBD.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Atendimento cadastrado com sucesso!');");
                    out.print("location.href='listar-cliente-veiculo.jsp';");
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
