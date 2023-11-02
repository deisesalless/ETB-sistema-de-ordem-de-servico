
package entidade;

import lombok.*;

@Getter
@Setter
public class FormaDePagamento {
    
    private TabelaPreco servicoPreco;

    public FormaDePagamento() {
        this.servicoPreco = new TabelaPreco();
    }
    
    
    
}
