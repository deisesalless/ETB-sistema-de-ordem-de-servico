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
                    <%
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
            <tr>
                <td>
                    <a href="pagina-inicial.jsp">Página Inicial</a> |
                    <a href="form-cadastrar-perfil.jsp">Cadastrar Perfil</a> |
                    <a href="listar-perfil.jsp">Listar Perfil</a> |
                    <a href="form-cadastrar-usuario.jsp">Cadastrar Usuario</a> |
                    <a href="listar-usuario.jsp">Listar Usuario</a> |
                    <a href="form-cadastrar-funcionario.jsp">Cadastrar Funcionario</a> |
                    <a href="listar-funcionario.jsp">Listar Funcionario</a> |
                    <a href="form-cadastrar-cliente.jsp">Cadastrar Cliente & Veiculo</a> |
                    <a href="listar-cliente-veiculo.jsp">Listar Cliente & Veiculo</a> |
                    <a href="form-cadastrar-empresa.jsp">Cadastrar Empresa</a> |
                    <a href="listar-empresa.jsp">Listar Empresa</a> |
                    <a href="form-cadastrar-tabela-preco.jsp">Cadastrar Serviço/Preço</a> |
                    <a href="listar-tabela-preco.jsp">Listar Tabela de Preços</a> |
                    <a href="form-cadastrar-tipo-pagamento.jsp">Cadastrar Forma de Pagamento</a> |
                    <a href="listar-tipo-pagamento.jsp">Listar Formas de Pagamento</a> |
                    <a href="listar-cliente-veiculo1.jsp"> Teste Listar Cliente e Veiculo 1 </a> |
                <td>
            </tr>
        </table>
    </body>
</html>
