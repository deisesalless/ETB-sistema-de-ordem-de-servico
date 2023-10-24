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
                    <a href="form-cadastrar-cliente.jsp">Cadastrar Cliente</a> |
                    <a href="listar-cliente.jsp">Listar Cliente</a> |
                    <a href="listar-veiculo.jsp">Listar Veiculo</a> |
                    <a href="listar-cliente-veiculo.jsp">Listar Cliente e Veiculo</a> |
                    <!--
                    <a href="formulario-inserir-empresa.jsp">Inserir Empresa</a> |
                    <a href="listar-empresa.jsp">Listar Empresa</a> |
                    <a href="formulario-inserir-tabela-preco.jsp">Inserir Tabela Preço</a> |
                    <a href="listar-tabela-preco.jsp">Listar Tabela Preço</a> |
                    <a href="formulario-inserir-forma-pagamento.jsp">Inserir Forma de Pagamento</a> |
                    <a href="listar-forma-pagamento.jsp">Listar Formas de Pagamento</a> |
                    -->
                <td>
            </tr>
        </table>
    </body>
</html>
