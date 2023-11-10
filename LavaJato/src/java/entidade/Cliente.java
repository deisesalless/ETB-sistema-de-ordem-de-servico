
package entidade;

import lombok.*;

@Getter
@Setter
public class Cliente {
    
    private String telefone;
    private Pessoa pessoa;
    private int idGerado;

    public Cliente() {
        this.telefone = "";
        this.pessoa = new Pessoa();
        this.idGerado = idGerado;
    }
    
    
  
}
