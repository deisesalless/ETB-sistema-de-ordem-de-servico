package controller;

import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.UsuarioDAO;


@WebServlet(name = "AlterarUsuario", urlPatterns = {"/AlterarUsuario"})
public class AlterarUsuario extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Usuario</title>");  
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que o usuario digitou no formulario
            int id = Integer.parseInt(request.getParameter("id"));
            String nomeCompleto = request.getParameter("nomeCompleto");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
            
            // Verifica se o usuario realmente preencheu todos os campos
            if (nomeCompleto == null || nomeCompleto.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
            } else if (login == null || login.equalsIgnoreCase("")) {
                out.print("O campo Usuario deve ser preenchido!");
            } else if (senha == null || senha.equalsIgnoreCase("")) {
                out.print("O campo Senha deve ser preenchido!");        
            } else if (id_perfil<1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else if (id<1) {
                out.print("O ID do usuário não foi encontrado!");
            } else {
                
                try {
                    // Pega as informações do formulário e guarda nos atributos do objeto
                    Usuario usuario = new Usuario();
                    usuario.getPessoa().setId(id);
                    usuario.getPessoa().setNomeCompleto(nomeCompleto);
                    usuario.setLogin(login);
                    usuario.setSenha(senha);
                    usuario.getPerfil().setId_perfil(id_perfil);
                    
                    // Instancia um objeto do tipo UsuarioDAO
                    UsuarioDAO uDB = new UsuarioDAO();
                    // Conecta com o banco de dados e altera as informações
                    // Depois desconeta com o banco de dados
                    uDB.conectar();
                    uDB.alterar(usuario);
                    uDB.desconectar();
                    // Imprime na tela mensagem de sucesso e redireciona o usuario para a pagina listar
                    out.print("<script language='javascript'>");
                    out.print("alert('Cadastro do usuario atualizado com sucesso!');");
                    out.print("location.href='listar-usuario.jsp';");
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
