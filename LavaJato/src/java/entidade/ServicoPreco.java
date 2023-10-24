
package entidade;

import lombok.*;

@Getter
@Setter
public class ServicoPreco {
    
    private int id;
    private String nome;
    private double precoVeiculoPequeno;
    private double precoVeiculoMedio;
    private double precoVeiculoGrande;
    private boolean status;

}
