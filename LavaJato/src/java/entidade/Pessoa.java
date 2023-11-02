
package entidade;

import java.util.Date;
import lombok.*;

@Getter
@Setter
public class Pessoa {
    
    private int id;
    private String nomeCompleto;
    private Date dataCadastro;
    private boolean status;
    
    public Pessoa() {
        this.id = 0; 
        this.nomeCompleto = "";
        this.status = false; 
    }
  
}
