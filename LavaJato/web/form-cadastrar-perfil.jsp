<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_cadastrar_perfil;
                if(formulario.nome.value==""){
                    alert("O campo perfil deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                return true;
            }
        </script>
        <title>Página de cadastrar Perfil</title>
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
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp"%>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330" align="center">
                        <h2>Cadastrar Perfil</h2>
                        <form name="form_cadastrar_perfil" action="cadastrar_perfil.do" method="post" onsubmit="return validaForm();">
                            <table width="500">
                                <tr>
                                    <td>Perfil:</td>
                                    <td><input type="text" name="nome" size="30" /> </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Salvar" /> </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>