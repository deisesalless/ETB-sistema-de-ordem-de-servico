
package controller;

import DataUtility.DataUtility;
import entidade.Perfil;
import entidade.Pessoa;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.UsuarioDAO;

@WebServlet(name = "CadastrarUsuario", urlPatterns = {"/CadastrarUsuario"})
public class CadastrarUsuario extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Usuario</title>");
            out.println("</head>");
            out.println("<body>");
            
            // Recebe as informações que foram preenchidas no formulario do usuario
            String nomeCompleto = request.getParameter("nomeCompleto");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String dataCadastro = request.getParameter("dataCadastro");
            // Converte de String para int
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));

            // Verifica se os campos foram devidamente preenchidos pelo usuario
            if (nomeCompleto == null || nomeCompleto.equalsIgnoreCase("")) {
                out.print("O campo Nome Completo deve ser preenchido!");
            } else if (login == null || login.equalsIgnoreCase("")) {
                out.print("O campo Login deve ser preenchido!");
            } else if (senha == null || senha.equalsIgnoreCase("")) {
                out.print("O campo Senha deve ser preenchido!");
            } else if (dataCadastro == null || dataCadastro.equalsIgnoreCase("")) {
                out.print("O campo Data do Cadastro deve ser preenchido!");
            } else if (id_perfil<1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else {
                
                try {
                    Usuario usuarioo = new Usuario();
                    usuarioo.setPessoa(new Pessoa());
                    usuarioo.setPerfil(new Perfil());
                    
                    usuarioo.getPessoa().setNomeCompleto(nomeCompleto);
                    usuarioo.setLogin(login);
                    usuarioo.setSenha(senha);
                    // Muda o formado de String para data
                    usuarioo.getPessoa().setDataCadastro(DataUtility.stringToDate(dataCadastro));
                    usuarioo.getPerfil().setId_perfil(id_perfil);
                    
                    UsuarioDAO usuarioDB = new UsuarioDAO();
                    usuarioDB.conectar();
                    usuarioDB.cadastrar(usuarioo);
                    usuarioDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Usuario cadastrado com sucesso!!');");
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
