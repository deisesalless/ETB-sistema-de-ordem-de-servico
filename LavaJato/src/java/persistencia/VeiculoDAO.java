
package persistencia;

import entidade.Veiculo;
import java.sql.*;
import java.util.*;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;


public class VeiculoDAO extends ConexaoComBancoDeDados {
    
    public VeiculoDAO() throws Exception {
    }
    
    // Método para inserir o veiculo no Banco de Dados
    public void cadastrar(Veiculo veiculo) throws Exception {
        String sql = "INSERT INTO veiculo (placa, cor, marca, id_cliente, status) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(veiculo.getPlaca()));
        pst.setString(2, veiculo.getCor());
        pst.setString(3, toUpperCase(veiculo.getMarca()));
        pst.setInt(4, veiculo.getCliente().getPessoa().getId());
        pst.setBoolean(5, true);
        pst.execute();
    }
    
    // Método para listar veiculos que estão no Banco de Dados
    public ArrayList<Veiculo> listar() throws Exception {
        ArrayList<Veiculo> listaDeVeiculo = new ArrayList<Veiculo>();
        String sql = "SELECT * FROM veiculo";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista dos veiculos
        while (lista.next()) {
            Veiculo veiculo = new Veiculo();
            veiculo.setPlaca(lista.getString("placa"));
            veiculo.setCor(lista.getString("cor"));
            veiculo.setMarca(lista.getString("marca"));
            veiculo.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            veiculo.setStatus(lista.getBoolean("status"));
            listaDeVeiculo.add(veiculo);
        }
        return listaDeVeiculo;
    }
    
    // Método para alterar o id_cliente do veiculo no Banco de Dados
    public void alterar(Veiculo veiculo) throws Exception {
        String sql = "UPDATE veiculo SET cor=?, marca=? WHERE placa = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, veiculo.getCor());
        pst.setString(2, toUpperCase(veiculo.getMarca()));
        pst.setString(3, veiculo.getPlaca());
        pst.execute();
    }
    
    // Método para ativar veiculo no Banco de Dados
    public void ativar(Veiculo veiculo) throws Exception {
        String sql = "UPDATE veiculo SET status=? WHERE placa=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setString(2, veiculo.getPlaca());
        pst.execute();
    }
    
    // Método para desativar veiculo no Banco de Dados
    public void desativar(Veiculo veiculo) throws Exception {
        String sql = "UPDATE veiculo SET status=? WHERE placa=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setString(2, veiculo.getPlaca());
        pst.execute();

    }
    
    // Método para pesquisar o veiculo pela placa no Banco de Dados
    public List pesquisarPorPlaca(String placa) throws Exception {
        List<Veiculo> veiculo = new ArrayList<Veiculo>();
        String sql = "SELECT * FROM veiculo WHERE placa=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setString(1, placa);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta a placa no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            Veiculo veiculosDados = new Veiculo();
            veiculosDados.setPlaca(lista.getString("placa"));
            veiculosDados.setCor(lista.getString("cor"));
            veiculosDados.setMarca(lista.getString("marca"));
            veiculosDados.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            veiculosDados.setStatus(lista.getBoolean("status"));
            veiculo.add(veiculosDados);
        }
        return veiculo;
    }
    
    
}
