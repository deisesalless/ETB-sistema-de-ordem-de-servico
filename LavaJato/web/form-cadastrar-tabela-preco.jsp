<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página cadastrar Tabela de Preços</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_inserir_tabela_preco";
                if(formulario.nome.value==""){
                    alert("O campo Nome do Serviço deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.precoVeiculoPequeno.value==""){
                    alert("O campo Preço do Veículo Pequeno deve ser preenchido!!");
                    formulario.precoVeiculoPequeno.focus();
                    return false;
                }
                if(formulario.precoVeiculoMedio.value==""){
                    alert("O campo Preço do Veículo Medio deve ser preenchido!!");
                    formulario.precoVeiculoMedio.focus();
                    return false;
                }
                if(formulario.precoVeiculoGrande.value==""){
                    alert("O campo Preço do Veículo Grande deve ser preenchido!!");
                    formulario.precoVeiculoGrande.focus();
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
                        <img src="imagens/banner.PNG" alt="banner"/>
                    </td>
                </tr>
                <tr>
                    <td width="760" height="20" valign="top">
                        <%@include file="menu.jsp"%> 
                    </td>
                </tr>
                <tr>
                    <td width="760" height="330">
                        <div align="center">
                            <h2>Inserir novo Serviço na Tabela de Serviços</h2>
                            <form name="form_cadastrar_tabela_preco" action="cadastrar_tabela_preco.do" method="post" onsubmit="return validaForm();">
                            <table width="400" border="0">
                                <tr>
                                    <td>Nome do serviço:</td>
                                    <td>
                                        <input type="text" name="nome">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Preço do Veículo Pequeno:</td>
                                    <td>
                                        <input type="text" name="precoVeiculoPequeno">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Preço do Veículo Medio:</td>
                                    <td>
                                        <input type="text" name="precoVeiculoMedio" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>Preço do Veículo Grande:</td>
                                    <td>
                                        <input type="text" name="precoVeiculoGrande" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Salvar"></td>
                                </tr>
                            </table>
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>