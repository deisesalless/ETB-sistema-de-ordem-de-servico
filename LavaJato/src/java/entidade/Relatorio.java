
package entidade;

import lombok.*;

@Getter
@Setter
public class Relatorio {
    
    private String data;
    private String valor;
    private FluxoDeCaixa fluxoDeCaixa;
    private Atendimento atendimento;
    private Funcionario funcionario;
    private Pessoa pessoa;
    private FormaDePagamento formaDePagamento;
    private TabelaPreco tabelaPreco;

    public Relatorio() {
        this.fluxoDeCaixa = new FluxoDeCaixa();
        this.atendimento = new Atendimento();
        this.funcionario = new Funcionario();
        this.pessoa = new Pessoa();
        this.formaDePagamento = new FormaDePagamento();
        this.tabelaPreco = new TabelaPreco();
    }

    public Relatorio(String data, String valor) {
        this.data = data;
        this.valor = valor;
    }
    
    
    
    

}
