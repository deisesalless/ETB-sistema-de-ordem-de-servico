package controller;

import entidade.Cliente;
import entidade.Veiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;
import persistencia.ClienteDAO;
import persistencia.VeiculoDAO;


@WebServlet(name = "AlterarClienteVeiculo", urlPatterns = {"/AlterarClienteVeiculo"})
public class AlterarClienteVeiculo extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Cliente Veiculo</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do funcionario
            int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
            String nomeCompleto = request.getParameter("nomeCompleto");
            String telefone = request.getParameter("telefone");
            
            int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
            String placa = toUpperCase(request.getParameter("placa"));
            String cor = request.getParameter("cor");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");

            // Verifica se os campos foram devidamente preenchidos
            if (nomeCompleto == null || nomeCompleto.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
            } else if (telefone == null || telefone.equalsIgnoreCase("")) {
                out.print("O campo Telefone deve ser preenchido!");
            } else if (placa == null || placa.equalsIgnoreCase("")) {
                out.print("O campo Placa deve ser preenchido!");
            } else if (cor == null || cor.equalsIgnoreCase("")) {
                out.print("O campo Cor deve ser preenchido!");
            } else if (marca == null || marca.equalsIgnoreCase("")) {
                out.print("O campo Marca deve ser preenchido!");
            } else if (modelo == null || modelo.equalsIgnoreCase("")) {
                out.print("O campo Modelo deve ser preenchido!");
            } else if (id_veiculo < 1) {
                out.print("O ID do veículo não foi encontrado!");
            } else if (id_cliente < 1) {
                out.print("O ID do cliente não foi encontrado!");
            } else {
                
                try {
                    
                    VeiculoDAO veiculoBD = new VeiculoDAO();
                    veiculoBD.conectar();
                    
                    ClienteDAO clienteBD = new ClienteDAO();
                    clienteBD.conectar();
                    
                    Veiculo veiculo = veiculoBD.pesquisarPorPlaca(placa);
                    Cliente cliente = clienteBD.pesquisarPorId(veiculo.getCliente().getPessoa().getId());

                    if (veiculo.getPlaca().equalsIgnoreCase(placa)) {
                        out.print("<script language='javascript'>");
                        cliente.getTelefone();
                        out.print("alert('A placa " + veiculo.getPlaca() + 
                                " já está vinculada ao cadastro do(a) cliente " + 
                                cliente.getPessoa().getNomeCompleto() + " Telefone: "+ cliente.getTelefone() + "');");
                        out.print("location.href='listar-cliente-veiculo.jsp';");
                        out.print("</script>");

                    } else {

                        // Instancia um objeto do tipo Cliente e armazena as informações que foram digitadas
                        cliente.getPessoa().setId(id_cliente);
                        cliente.getPessoa().setNomeCompleto(nomeCompleto);
                        cliente.setTelefone(telefone);                   

                        clienteBD.alterar(cliente);
                        clienteBD.desconectar();

                        veiculo.setId(id_veiculo);
                        veiculo.setPlaca(placa);
                        veiculo.setCor(cor);
                        veiculo.setMarca(marca);
                        veiculo.setModelo(modelo);

                        // Instancia um objeto do tipo VeiculoDAO, recebe as informações do objeto Veiculo e 
                        // inclui no Banco de Dados
                        veiculoBD.alterar(veiculo);
                        veiculoBD.desconectar();


                        out.print("<script language='javascript'>");
                        out.print("alert('Cliente e Veiculo atualizados com sucesso!');");
                        out.print("location.href='listar-cliente-veiculo.jsp';");
                        out.print("</script>");

                    }
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