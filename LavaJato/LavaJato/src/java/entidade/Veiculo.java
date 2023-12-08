
package entidade;

import lombok.*;

@Getter
@Setter
public class Veiculo {
    
    private int id;
    private String placa;
    private String modelo;
    private String cor;
    private String marca;
    private Cliente cliente;

    public Veiculo() {
        this.id = 0;
        this.placa = "";
        this.modelo = "";
        this.cor = "";
        this.marca = "";
        this.cliente = new Cliente();
    }

    
    

}
