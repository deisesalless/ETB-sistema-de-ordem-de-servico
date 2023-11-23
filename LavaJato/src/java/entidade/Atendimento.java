
package entidade;

import java.util.Date;
import lombok.*;

@Getter
@Setter
public class Atendimento {
    
    private int id;
    private Date data;
    private boolean statusAtendimento;
    private boolean statusPagamento;
    private double precoTotal;
    private double precoAdicional;
    private double precoDesconto;
    private String observacao;
    private Usuario usuario;
    private Funcionario funcionario;
    private Cliente cliente;
    private Veiculo veiculo;
    private FormaDePagamento formaDePagamento;
    private TabelaPreco tabelaPreco;
    private int idGerado;
    
    public Atendimento() {
    
    }

    public Atendimento(int id, Date data, boolean statusAtendimento, boolean statusPagamento, double precoTotal, double precoAdicional, double precoDesconto, String observacao, Usuario usuario, Funcionario funcionario, Cliente cliente, Veiculo veiculo, FormaDePagamento formaDePagamento, TabelaPreco tabelaPreco, int idGerado) {
        this.id = id;
        this.data = data;
        this.statusAtendimento = statusAtendimento;
        this.statusPagamento = statusPagamento;
        this.precoTotal = precoTotal;
        this.precoAdicional = precoAdicional;
        this.precoDesconto = precoDesconto;
        this.observacao = observacao;
        this.usuario = usuario;
        this.funcionario = funcionario;
        this.cliente = cliente;
        this.veiculo = veiculo;
        this.formaDePagamento = formaDePagamento;
        this.tabelaPreco = tabelaPreco;
        this.idGerado = idGerado;
    }

    

    
    
    
}
