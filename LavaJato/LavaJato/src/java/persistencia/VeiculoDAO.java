
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
        String sql = "INSERT INTO veiculo (id_cliente, placa, cor, marca, modelo) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, veiculo.getCliente().getPessoa().getId());
        pst.setString(2, toUpperCase(veiculo.getPlaca()));
        pst.setString(3, toUpperCase(veiculo.getCor()));
        pst.setString(4, toUpperCase(veiculo.getMarca()));
        pst.setString(5, toUpperCase(veiculo.getModelo()));
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
            veiculo.setId(lista.getInt("id"));
            veiculo.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            veiculo.setPlaca(lista.getString("placa"));
            veiculo.setCor(lista.getString("cor"));
            veiculo.setMarca(lista.getString("marca"));
            veiculo.setModelo(lista.getString("modelo"));
            listaDeVeiculo.add(veiculo);
        }
        return listaDeVeiculo;
    }
    
    // Método para alterar o id_cliente do veiculo no Banco de Dados
    public void alterar(Veiculo veiculo) throws Exception {
        String sql = "UPDATE veiculo SET placa=?, cor=?, marca=?, modelo=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(veiculo.getPlaca()));
        pst.setString(2, toUpperCase(veiculo.getCor()));
        pst.setString(3, toUpperCase(veiculo.getMarca()));
        pst.setString(4, toUpperCase(veiculo.getModelo()));
        pst.setInt(5, veiculo.getId());
        pst.execute();
    }
    
    // Pesquisar o veiculo pelo id no banco de dados  
    public Veiculo pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM veiculo WHERE id = " + id;
        Statement stm = conexao.createStatement();
        ResultSet lista = stm.executeQuery(sql);
        Veiculo veiculo = new Veiculo();
        
        // Consulta o id no banco de dados e retorna a lista com todas as informações
        if (lista.next()) {
            veiculo.setId(lista.getInt("id"));
            veiculo.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            veiculo.setPlaca(lista.getString("placa"));
            veiculo.setCor(lista.getString("cor"));
            veiculo.setMarca(lista.getString("marca"));
            veiculo.setModelo(lista.getString("modelo"));
        }
        return veiculo;
        
        
    }
    
    // Método para pesquisar o veiculo pela placa no Banco de Dados
    public Veiculo pesquisarPorPlaca(String placa) throws Exception {
        String sql = "SELECT * FROM veiculo WHERE placa = ?";
        PreparedStatement pstm = conexao.prepareStatement(sql);
        pstm.setString(1, placa);
        ResultSet lista = pstm.executeQuery();
        Veiculo veiculo = new Veiculo();
        
        // Consulta a placa no banco de dados e retorna a lista com todas as informações
        if (lista.next()) {
            veiculo.setPlaca(lista.getString("placa"));
            veiculo.setCor(lista.getString("cor"));
            veiculo.setMarca(lista.getString("marca"));
            veiculo.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
        }
        return veiculo;
    }
    
    
}
