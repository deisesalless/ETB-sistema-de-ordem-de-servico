<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Validar o Login</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_validar_login;
                if(formulario.login.value==""){
                    alert("O campo Login deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O campo Senha deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div align="center">
            <table width="760" border="1">
                <tr>
                    <td width="760" height="150">
                        <img src="imagens/banner.PNG" alt="banner">
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <form name="form_validar_login" action="validar_login.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Login:</td>
                                    <td><input type="text" name="login" size="30"> </td>
                                </tr>
                                <tr>
                                    <td>Senha:</td>
                                    <td><input type="password" name="senha" size="30"> </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Entrar"></td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
