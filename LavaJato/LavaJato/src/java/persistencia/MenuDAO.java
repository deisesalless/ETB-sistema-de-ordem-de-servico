
package persistencia;

import entidade.Menu;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static org.apache.taglibs.standard.functions.Functions.toLowerCase;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;

public class MenuDAO extends ConexaoComBancoDeDados {
    
    public MenuDAO() throws Exception {
    }
    
    public void cadastrar(Menu menu) throws Exception {
        String sql = "INSERT INTO menu (menu, link) VALUES(?,?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(menu.getMenu()));
        pst.setString(2, toLowerCase(menu.getLink()));
        pst.execute();
    }

    public void excluir(Menu menu) throws Exception {
        String sql = "DELETE FROM menu WHERE id_menu=?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, menu.getId_menu());
        pst.execute();
    }

    public ArrayList<Menu> listar() throws Exception {
        ArrayList<Menu> listaDeMenu = new ArrayList<Menu>();
        String sql = "SELECT * FROM menu";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();

        while (lista.next()) {
            Menu menu = new Menu();
            menu.setId_menu(lista.getInt("id_menu"));
            menu.setMenu(lista.getString("menu"));
            menu.setLink(lista.getString("link"));
            
            listaDeMenu.add(menu);
        }

        return listaDeMenu;
    }
    
    public void alterar(Menu menu) throws Exception {
        String sql = "UPDATE menu SET menu=?, link=? WHERE id_menu=?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        
        pst.setString(1, toUpperCase(menu.getMenu()));
        pst.setString(2, toLowerCase(menu.getLink()));
        pst.setInt(3, menu.getId_menu());
        pst.execute();
    }

    public Menu pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM menu WHERE id_menu = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setInt(1, id);
        ResultSet rs = pst.executeQuery();
        
        Menu menu = new Menu();
        if (rs.next()) {
            menu.setId_menu(rs.getInt("id_menu"));
            menu.setMenu(rs.getString("menu"));
            menu.setLink(rs.getString("link"));
        }
        return menu;
    }

    
}
