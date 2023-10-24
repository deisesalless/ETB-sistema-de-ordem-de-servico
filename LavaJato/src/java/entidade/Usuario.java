
package entidade;

import lombok.*;

@Getter
@Setter
public class Usuario {
    
    private String login;
    private String senha;
    private Pessoa pessoa;
    private Perfil perfil;
    
    public Usuario() {
        this.login = "";
        this.senha = "";
        this.pessoa = new Pessoa(); 
        this.perfil = new Perfil();
    }
 
}
