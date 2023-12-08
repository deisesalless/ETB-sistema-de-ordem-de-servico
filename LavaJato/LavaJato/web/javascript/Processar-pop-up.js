function fazPost(url, body) {
    console.log(body)
}

function enviarParaServlet(){
    
    let url = "cadastrar_atendimento.do";
    var observacao = document.getElementById("observacoesPopUp").value;
    var valorTotal = document.getElementById("valorTotalPopUp").value;
    console.log(observacao);
    console.log(valorTotal);
    
    body = {
        "observacao" : observacao,
        "valor_total" : valorTotal
    }
}