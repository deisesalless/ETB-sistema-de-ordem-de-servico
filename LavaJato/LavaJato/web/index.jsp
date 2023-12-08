<%@page import="java.util.ArrayList"%>
<%@page import="entidade.Usuario"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de Realizar o Login</title>
        <link rel="shortcut icon" href="imagens_site/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="estilo_layout/login.css">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_validar_login;
                if(formulario.login.value===""){
                    alert("O campo Login deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value===""){
                    alert("O campo Senha deve ser preenchido!");
                    formulario.senha.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="logo-section">
                <img src="imagens_site/logo.png" alt="Logo Lava Jato" class="logo">
            </div>
            <div class="login-section">
                <h2>Login</h2>
                <form name="form_validar_login" action="validar_login.do" method="post" onsubmit="return validaForm();">
                    <input type="text" name="login" placeholder="Nome de usuário" required>
                    <input type="password" name="senha" placeholder="Senha" required>
                    <button type="submit">Entrar</button>
                </form>
            </div>
        </div>
    </body>
</html>
