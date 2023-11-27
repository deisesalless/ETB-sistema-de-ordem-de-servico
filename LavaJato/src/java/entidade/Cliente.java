
package entidade;

import lombok.*;

@Getter
@Setter
public class Cliente {
    
    private String telefone;
    private Pessoa pessoa;
    private int idGerado;
    
    public Cliente() {
        this.pessoa = new Pessoa();
    }

    public Cliente(String telefone, Pessoa pessoa, int idGerado) {
        this.telefone = telefone;
        this.pessoa = pessoa;
        this.idGerado = idGerado;
    }

}
