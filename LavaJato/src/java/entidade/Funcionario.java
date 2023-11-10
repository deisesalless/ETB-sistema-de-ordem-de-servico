
package entidade;

import lombok.*;

@Getter
@Setter
public class Funcionario {
    
    private String apelido;
    private String telefone;
    private Perfil perfil;
    private Pessoa pessoa;

    public Funcionario() {
        this.apelido = "";
        this.telefone = "";
        this.perfil = new Perfil();
        this.pessoa = new Pessoa();
    }
 
}
