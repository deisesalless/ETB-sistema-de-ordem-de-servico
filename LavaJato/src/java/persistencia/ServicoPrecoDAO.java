
package persistencia;

import entidade.ServicoPreco;
import java.sql.*;
import java.util.*;


public class ServicoPrecoDAO extends ConexaoComBancoDeDados {
    
    public ServicoPrecoDAO() throws Exception {
    }
    
    // Método para cadastrar serviço e preço no Banco de Dados
    public void cadastrar(ServicoPreco servicoPreco) throws Exception {
        String sql = "INSERT INTO servico_e_preco (nome, precoVeiculoPequeno, precoVeiculoMedio, precoVeiculoGrande, status) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, servicoPreco.getNome());
        pst.setDouble(2, servicoPreco.getPrecoVeiculoPequeno());
        pst.setDouble(3, servicoPreco.getPrecoVeiculoMedio());
        pst.setDouble(4, servicoPreco.getPrecoVeiculoGrande());
        pst.setBoolean(5, true);
        pst.execute();
    }
    
    // Método para listar os preços dos serviços que estão no Banco de Dados
    public ArrayList<ServicoPreco> listar() throws Exception {
        ArrayList<ServicoPreco> listaDePrecos = new ArrayList<ServicoPreco>();
        String sql = "SELECT * FROM servico_e_preco";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista dos serviços com seus preços
        while (lista.next()) {
            ServicoPreco servicoPreco = new ServicoPreco();
            servicoPreco.setId(lista.getInt("id"));
            servicoPreco.setNome(lista.getString("nome"));
            servicoPreco.setPrecoVeiculoPequeno(lista.getDouble("precoVeiculoPequeno"));
            servicoPreco.setPrecoVeiculoMedio(lista.getDouble("precoVeiculoMedio"));
            servicoPreco.setPrecoVeiculoGrande(lista.getDouble("precoVeiculoGrande"));
            servicoPreco.setStatus(lista.getBoolean("status"));
            listaDePrecos.add(servicoPreco);
        }
        return listaDePrecos;
    }
    
    // Método para alterar o nome do serviço e seu preço Banco de Dados
    public void alterar(ServicoPreco servicoPreco) throws Exception {
        String sql = "UPDATE servico_e_preco SET nome=?, precoVeiculoPequeno=?, precoVeiculoMedio=?, precoVeiculoGrande=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, servicoPreco.getId());
        pst.setString(2, servicoPreco.getNome());
        pst.setDouble(3, servicoPreco.getPrecoVeiculoPequeno());
        pst.setDouble(4, servicoPreco.getPrecoVeiculoMedio());
        pst.setDouble(5, servicoPreco.getPrecoVeiculoGrande());
        pst.execute();
    }
    
    // Método para ativar serviço e preço no Banco de Dados
    public void ativar(ServicoPreco servicoPreco) throws Exception {
        String sql = "UPDATE servico_e_preco SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, servicoPreco.getId());
        pst.execute();
    }
    
    // Método para desativar serviço e preço no Banco de Dados
    public void desativar(ServicoPreco servicoPreco) throws Exception {
        String sql = "UPDATE servico_e_preco SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, servicoPreco.getId());
        pst.execute();

    }
    
    // Método para pesquisar serviço e preço por Id no Banco de Dados
    public List pesquisarPorId(int id) throws Exception {
        List<ServicoPreco> servicoPreco = new ArrayList<ServicoPreco>();
        String sql = "SELECT * FROM servico_e_preco WHERE id=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta o id no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            ServicoPreco tabelaDePrecos = new ServicoPreco();
            tabelaDePrecos.setId(lista.getInt("id"));
            tabelaDePrecos.setNome(lista.getString("nome"));
            tabelaDePrecos.setPrecoVeiculoPequeno(lista.getDouble("precoVeiculoPequeno"));
            tabelaDePrecos.setPrecoVeiculoMedio(lista.getDouble("precoVeiculoMedio"));
            tabelaDePrecos.setPrecoVeiculoGrande(lista.getDouble("precoVeiculoGrande"));
            tabelaDePrecos.setStatus(lista.getBoolean("status"));
            servicoPreco.add(tabelaDePrecos);
        }
        return servicoPreco;
    }
    
}
