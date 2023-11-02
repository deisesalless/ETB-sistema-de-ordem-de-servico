
package persistencia;

import entidade.TabelaPreco;
import java.sql.*;
import java.util.*;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;


public class TabelaPrecoDAO extends ConexaoComBancoDeDados {
    
    public TabelaPrecoDAO() throws Exception {
    }
    
    // Método para cadastrar nome do serviço e preço no Banco de Dados
    public void cadastrar(TabelaPreco tabelaPreco) throws Exception {
        String sql = "INSERT INTO tabela_preco (nome, precoVeiculoPequeno, precoVeiculoMedio, precoVeiculoGrande, status) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(tabelaPreco.getNome()));
        pst.setDouble(2, tabelaPreco.getPrecoVeiculoPequeno());
        pst.setDouble(3, tabelaPreco.getPrecoVeiculoMedio());
        pst.setDouble(4, tabelaPreco.getPrecoVeiculoGrande());
        pst.setBoolean(5, true);
        pst.execute();
    }
    
    // Método para listar a tabela de serviços e precços do Banco de Dados
    public ArrayList<TabelaPreco> listar() throws Exception {
        ArrayList<TabelaPreco> listaDePrecos = new ArrayList<TabelaPreco>();
        String sql = "SELECT * FROM tabela_preco";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista do nome dos serviços e seus preços
        while (lista.next()) {
            TabelaPreco tabelaPreco = new TabelaPreco();
            tabelaPreco.setId(lista.getInt("id"));
            tabelaPreco.setNome(lista.getString("nome"));
            tabelaPreco.setPrecoVeiculoPequeno(lista.getDouble("precoVeiculoPequeno"));
            tabelaPreco.setPrecoVeiculoMedio(lista.getDouble("precoVeiculoMedio"));
            tabelaPreco.setPrecoVeiculoGrande(lista.getDouble("precoVeiculoGrande"));
            tabelaPreco.setStatus(lista.getBoolean("status"));
            listaDePrecos.add(tabelaPreco);
        }
        return listaDePrecos;
    }
    
    // Método para alterar o nome do serviço e seu preço no Banco de Dados
    public void alterar(TabelaPreco tabelaPreco) throws Exception {
        String sql = "UPDATE tabela_preco SET nome=?, precoVeiculoPequeno=?, precoVeiculoMedio=?, precoVeiculoGrande=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, tabelaPreco.getId());
        pst.setString(2, toUpperCase(tabelaPreco.getNome()));
        pst.setDouble(3, tabelaPreco.getPrecoVeiculoPequeno());
        pst.setDouble(4, tabelaPreco.getPrecoVeiculoMedio());
        pst.setDouble(5, tabelaPreco.getPrecoVeiculoGrande());
        pst.execute();
    }
    
    // Método para ativar serviço e preço no Banco de Dados
    public void ativar(TabelaPreco servicoPreco) throws Exception {
        String sql = "UPDATE tabela_preco SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, servicoPreco.getId());
        pst.execute();
    }
    
    // Método para desativar serviço e preço no Banco de Dados
    public void desativar(TabelaPreco servicoPreco) throws Exception {
        String sql = "UPDATE tabela_preco SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, servicoPreco.getId());
        pst.execute();

    }
    
    // Método para pesquisar serviço e preço por Id no Banco de Dados
    public List pesquisarPorId(int id) throws Exception {
        List<TabelaPreco> servicoPreco = new ArrayList<TabelaPreco>();
        String sql = "SELECT * FROM tabela_preco WHERE id=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta o id no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            TabelaPreco tabelaDePrecos = new TabelaPreco();
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
