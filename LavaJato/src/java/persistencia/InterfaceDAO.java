
package persistencia;

import java.util.ArrayList;


public interface InterfaceDAO <K, T> {
    
    public void cadastrar(T entidade);
    
    public ArrayList listar();
    
    public void alterarCadastro(T entidade);
    
    public void ativar(T entidade);
    
    public void desativar(T entidade);
    
    public T buscarPorId(K id);
    
}
