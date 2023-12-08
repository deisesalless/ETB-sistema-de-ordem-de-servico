
package entidade;

import lombok.*;

@Getter
@Setter
public class TabelaPreco {
    
    private int id;
    private String nome;
    private double precoVeiculoPequeno;
    private double precoVeiculoMedio;
    private double precoVeiculoGrande;
    private boolean status;

    public TabelaPreco() {
        this.id = 0;
        this.nome = "";
        this.precoVeiculoPequeno = 0.00;
        this.precoVeiculoMedio = 0.00;
        this.precoVeiculoGrande = 0.00;
        this.status = false;
    }
    
    

}
