
package entidade;

import lombok.*;

@Getter
@Setter
public class Perfil {
    
    private int id_perfil;
    private String nome;
    private boolean status;
    
    public Perfil() {
    
    }

    public Perfil(int id_perfil, String nome, boolean status) {
        this.id_perfil = id_perfil;
        this.nome = nome;
        this.status = status;
    }
    
    
    
}
