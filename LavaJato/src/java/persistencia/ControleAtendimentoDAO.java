
package persistencia;

import entidade.ControleAtendimento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ControleAtendimentoDAO extends ConexaoComBancoDeDados {
    
    public ControleAtendimentoDAO() throws Exception {
    
    }
    
    public void cadastrar(ControleAtendimento controleAtendimento) throws Exception {
        String sql = "INSERT INTO controle_atendimento (id_atendimento, id_servico) VALUES(?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, controleAtendimento.getAtendimento().getIdGerado());
        pst.setInt(2, controleAtendimento.getServico().getId());
        pst.execute();
    }
    
    public List<ControleAtendimento> listar() throws Exception {
        List<ControleAtendimento> listaDeControle = new ArrayList<ControleAtendimento>();
        String sql = "SELECT * FROM controle_atendimento";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista dos veiculos
        while (lista.next()) {
            ControleAtendimento controle = new ControleAtendimento();
            controle.setId(lista.getInt("id"));
            controle.getAtendimento().setId(lista.getInt("id_atendimento"));
            controle.getServico().setId(lista.getInt("id_servico"));
            listaDeControle.add(controle);
        }
        return listaDeControle;
    }
    
}
