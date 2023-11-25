
package persistencia;

import entidade.Menu;
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
            perfil.setId_perfil(lista.getInt("id_perfil"));
            perfil.setNome(lista.getString("nome"));
            perfil.setStatus(lista.getBoolean("status"));
            listaDePerfis.add(perfil);
        }
        // Retorna a lista de perfis que estão ativados e desativados no banco de dados
        return listaDePerfis;
    }
    
    // Método para alterar forma de pagamento no Banco de Dados
    public void alterar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET nome=? WHERE id_perfil = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toLowerCase(perfil.getNome()));
        pst.setInt(2, perfil.getId_perfil());
        pst.execute();
    }
    
    // Método para ativar perfil no Banco de Dados
    public void ativar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET status=? WHERE id_perfil=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, perfil.getId_perfil());
        pst.execute();
    }
    
    // Método para desativar o perfil na tabela perfil no Banco de Dados
    public void desativar(Perfil perfil) throws Exception {
        String sql = "UPDATE perfil SET status=? WHERE id_perfil=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, perfil.getId_perfil());
        pst.execute();
    }
    
    // Método para pesquisar perfil por Id no Banco de Dados
    public Perfil pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM perfil WHERE id_perfil = " + id;
        Statement stm = conexao.createStatement();
        ResultSet lista = stm.executeQuery(sql);
        Perfil perfil = new Perfil();

        if (lista.next()) {
            perfil.setId_perfil(lista.getInt("id_perfil"));
            perfil.setNome(lista.getString("nome"));
        }
        return perfil;
    }
    
        public List<Menu> menusVinculados(int id) throws Exception {
        List<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id_menu IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Menu m = new Menu();
            m.setId_menu(rs.getInt("id_menu"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }

        return lista;
    }

    public List<Menu> menusDesvinculados(int id) throws Exception {
        List<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu WHERE id_menu NOT IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Menu m = new Menu();
            m.setId_menu(rs.getInt("id_menu"));
            m.setMenu(rs.getString("menu"));
            m.setLink(rs.getString("link"));
            lista.add(m);
        }

        return lista;
    }

    public void vincularMenu(int id_menu, int id_perfil) throws Exception {
        String sql = "INSERT INTO menu_perfil (id_menu, id_perfil) VALUES(?,?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, id_menu);
        pst.setInt(2, id_perfil);
        pst.execute();
    }

    public void desvincularMenu(int id_menu, int id_perfil) throws Exception {
        String sql = "DELETE FROM menu_perfil WHERE id_menu=? AND id_perfil=?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, id_menu);
        pst.setInt(2, id_perfil);
        pst.execute();
    }
    
}
