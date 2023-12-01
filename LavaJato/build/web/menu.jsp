<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Menu</title>
    </head>
    <body>
        <table width="100%">
            <tr>
                <td>
                    <% // Mostra o usuario que está logado
                        Usuario usuario = new Usuario();
                        try{
                            usuario = (Usuario) session.getAttribute("usuario");
                            out.print("Olá " + usuario.getLogin() + " (<a href='sair.jsp'>Sair</a>)");
                            if (usuario == null){
                                response.sendRedirect("index.jsp");
                            }
                        }catch(Exception e){
                            //out.print(e);
                            response.sendRedirect("index.jsp");
                        }

                    %>
                </td>
            </tr>
        </table>
                
        <table width="100%">
            <tr>
                <td>
                    <a href="pagina-inicial.jsp"> Inicio </a> |
                    <a href="listar-perfil.jsp"> Perfil </a> |
                    <a href="listar-usuario.jsp"> Usuario </a> |
                    <a href="listar-menu.jsp"> Menu </a> |
                    <a href="listar-funcionario.jsp"> Funcionario </a> |
                    <a href="listar-tipo-pagamento.jsp"> Formas de Pagamento </a> |
                    <a href="listar-tabela-preco.jsp"> Tabela de Preços </a> |
                    <a href="listar-cliente-veiculo.jsp"> Cliente & Veiculo </a> |
                    <a href="listar-atendimento.jsp"> Listar Atendimentos </a> |
                <td>
            </tr>
        </table>
    </body>
</html>
