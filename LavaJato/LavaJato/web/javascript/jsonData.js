
function jsonData() {
    
    // Captura os valores dos campos observacao e valorTotal que estão no Pop-up
    var observacao = document.getElementById('observacaoInput');
    var valorTotal = document.getElementById('valorTotalPopUp').innerText;
    
    // Cria um objeto JSON e atribui os valores corretamente
    let json = { 
        observacao = observacao,
        valorTotal = valorTotal
    };
    
    return json;
}
