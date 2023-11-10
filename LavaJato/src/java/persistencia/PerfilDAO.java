
package persistencia;

import entidade.FormaDePagamento;
import entidade.Perfil;
import java.sql.*;
import java.util.*;
import static org.apache.taglibs.standard.functions.Functions.toLowerCase;


public class PerfilDAO extends ConexaoComBancoDeDados {
    
    public PerfilDAO() throws Exception {
    }
    
    // Método para inserir o nome do perfil no Banco de Dados
    public void cadastrar(Perfil perfil) throws Exception {
        String sql = "INSERT INTO perfil (nome, status) VALUES(?,?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toLowerCase(perfil.getNome()));
        pst.setBoolean(2, true);
        pst.execute();
    }
    
    // Método para listar os perfis do Banco de Dados
    public ArrayList<Perfil> listar() throws Exception {
        ArrayList<Perfil> listaDePerfis = new ArrayList<Perfil>();
        String sql = "SELECT * FROM perfil";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista da tabela perfil do Banco de Dados
        while (lista.next()) {
            Perfil perfil = new Perfil();
            perfil.setId(lista.getInt("id"));
            perfil.setNome(lista.getString("nome"));
            perfil.setStatus(lista.getBoolean("status"));
            listaDePerfis.add(perfil);
        }
        // Retorna a lista de perfis que estão ativados e desativados no banco de dados
        return listaDePerfis;
    }
    
    // Método para alterar forma de pagamento no Banco de Dados
    public void alterar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET nome=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toLowerCase(perfil.getNome()));
        pst.setInt(2, perfil.getId());
        pst.execute();
    }
    
    // Método para ativar perfil no Banco de Dados
    public void ativar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, perfil.getId());
        pst.execute();
    }
    
    // Método para desativar o perfil na tabela perfil no Banco de Dados
    public void desativar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, perfil.getId());
        pst.execute();
    }
    
    // Método para pesquisar perfil por Id no Banco de Dados
    public Perfil pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM perfil WHERE id = " + id;
        Statement stm = conexao.createStatement();
        ResultSet lista = stm.executeQuery(sql);
        Perfil perfil = new Perfil();

        if (lista.next()) {
            perfil.setId(lista.getInt("id"));
            perfil.setNome(lista.getString("nome"));
        }
        return perfil;
    }
    
}
