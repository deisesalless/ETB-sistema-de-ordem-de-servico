
package entidade;

import lombok.*;

@Getter
@Setter
public class ControleAtendimento {
    
    private int id;
    private Atendimento atendimento;
    private TabelaPreco servico;

    public ControleAtendimento() {

    }

    public ControleAtendimento(int id, Atendimento atendimento, TabelaPreco servico) {
        this.id = id;
        this.atendimento = atendimento;
        this.servico = servico;
    }
    
    
}
