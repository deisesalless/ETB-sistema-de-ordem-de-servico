
package entidade;

import java.util.Date;
import lombok.*;

@Getter
@Setter
public class FluxoDeCaixa {
    
    private int id;
    private String descricao;
    private double valor;
    private Date data;
    
    public FluxoDeCaixa(){
    
    }

    public FluxoDeCaixa(int id, String descricao, double valor, Date data) {
        this.id = id;
        this.descricao = descricao;
        this.valor = valor;
        this.data = data;
    }
  
}
