
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
        
        this.pessoa = new Pessoa();
        this.perfil = new Perfil();
    }

    public Funcionario(String apelido, String telefone, Perfil perfil, Pessoa pessoa) {
        this.apelido = apelido;
        this.telefone = telefone;
        this.perfil = perfil;
        this.pessoa = pessoa;
    }

    
 
}
