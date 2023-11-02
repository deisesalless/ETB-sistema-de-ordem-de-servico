
package entidade;

import java.util.Date;
import lombok.*;

@Getter
@Setter
public class Empresa {
    
    private String cnpj;
    private String razaoSocial;
    private String nomeFantasia;
    private String responsavel;
    private Date dataCadastro;
    private boolean status;
    
}
