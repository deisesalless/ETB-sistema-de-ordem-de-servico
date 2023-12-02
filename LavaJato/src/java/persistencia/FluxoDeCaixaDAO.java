
package persistencia;

import entidade.FluxoDeCaixa;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;

public class FluxoDeCaixaDAO extends ConexaoComBancoDeDados {
    
    public FluxoDeCaixaDAO() throws Exception {
        
    }
    
    public void cadastrar(FluxoDeCaixa fluxoDeCaixa) throws Exception {
        String sql = "INSERT INTO fluxo_caixa (data, descricao, valor) VALUES(?, ?, ?)";

        PreparedStatement pst = conexao.prepareStatement(sql);
        
        // Cria um objeto Timestamp utilizando o método getTime() do objeto Date
        Timestamp timestamp = new Timestamp(fluxoDeCaixa.getData().getTime());
        pst.setTimestamp(1, timestamp);
        pst.setString(2, toUpperCase(fluxoDeCaixa.getDescricao()));
        pst.setDouble(3, fluxoDeCaixa.getValor());
        pst.execute();
    }
    
    public List<FluxoDeCaixa> listar() throws Exception {
        List<FluxoDeCaixa> listaDeSaidaCaixa = new ArrayList<FluxoDeCaixa>();
        String sql = "SELECT * FROM fluxo_caixa";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        while (lista.next()) {
            FluxoDeCaixa fluxoDeCaixa = new FluxoDeCaixa();           
            fluxoDeCaixa.setId(lista.getInt("id"));
            fluxoDeCaixa.setData(lista.getTimestamp("data"));
            fluxoDeCaixa.setDescricao(lista.getString("descricao"));
            fluxoDeCaixa.setValor(lista.getDouble("valor"));
            listaDeSaidaCaixa.add(fluxoDeCaixa);
        }
        return listaDeSaidaCaixa;
    }
    
    public void excluir(FluxoDeCaixa fluxoDeCaixa) throws Exception {
        String sql = "DELETE FROM fluxo_caixa WHERE id=?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, fluxoDeCaixa.getId());
        pst.execute();
    }
}
