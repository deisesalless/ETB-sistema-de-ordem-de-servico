
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
        this.pessoa = new Pessoa();
        this.perfil = new Perfil();
    }

    public Usuario(String login, String senha, Pessoa pessoa, Perfil perfil) {
        this.login = login;
        this.senha = senha;
        this.pessoa = pessoa;
        this.perfil = perfil;
    }

    

}
