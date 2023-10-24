
package entidade;

import java.util.Date;
import lombok.*;

@Getter
@Setter
public class Pessoa {
    
    private int id;
    private String nome;
    private String sobrenome;
    private Date dataCadastro;
    private boolean status;
    
    public Pessoa() {
        this.id = 0; 
        this.nome = "";
        this.sobrenome = "";
        this.status = false; 
    }
  
}
