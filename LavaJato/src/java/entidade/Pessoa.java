
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
    
    }

    public Pessoa(int id, String nomeCompleto, Date dataCadastro, boolean status) {
        this.id = id;
        this.nomeCompleto = "";
        this.dataCadastro = dataCadastro;
        this.status = false;
    }

  
}
