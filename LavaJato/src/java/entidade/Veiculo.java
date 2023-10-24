
package entidade;

import lombok.*;

@Getter
@Setter
public class Veiculo {
    
    private String placa;
    private String cor;
    private String marca;
    private Cliente cliente;
    private boolean status;

    public Veiculo() {
        this.placa = "";
        this.cor = "";
        this.marca = "";
        this.cliente = new Cliente();
        this.status = status;
    }
    
    

}
