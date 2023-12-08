
package entidade;

import java.sql.Timestamp;
import java.util.Date;
import lombok.*;

@Getter
@Setter
public class Atendimento {
    
    private int id;
    private Date data;
    private boolean statusAtendimento;
    private boolean statusPagamento;
    private double valorTotal;
    private double precoAdicional;
    private double precoDesconto;
    private String observacao;
    private Pessoa pessoa;
    private Usuario usuario;
    private Funcionario funcionario;
    private Cliente cliente;
    private Veiculo veiculo;
    private FormaDePagamento formaDePagamento;
    private TabelaPreco tabelaPreco;
    
    public Atendimento(){
        this.pessoa = new Pessoa();
        this.usuario = new Usuario();
        this.funcionario = new Funcionario();
        this.cliente = new Cliente();
        this.veiculo = new Veiculo();
        this.formaDePagamento = new FormaDePagamento();
        this.tabelaPreco = new TabelaPreco();
    }

    public Atendimento(int id, Date data, boolean statusAtendimento, boolean statusPagamento, double valorTotal, double precoAdicional, double precoDesconto, String observacao) {
        this.id = id;
        this.data = data;
        this.statusAtendimento = statusAtendimento;
        this.statusPagamento = statusPagamento;
        this.valorTotal = valorTotal;
        this.precoAdicional = precoAdicional;
        this.precoDesconto = precoDesconto;
        this.observacao = observacao;
    }
    
    
  
}
