
package persistencia;

import DataUtility.DataUtility;
import entidade.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import static org.apache.taglibs.standard.functions.Functions.toLowerCase;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;



public class UsuarioDAO extends ConexaoComBancoDeDados{
        
    public UsuarioDAO() throws Exception {
    }
    
    // Método para inserir a usuario no Banco de Dados
    public void cadastrar(Usuario usuario) throws Exception {
        String sql = "INSERT INTO usuario (nomeCompleto, login, senha, dataCadastro, id_perfil, status) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(usuario.getPessoa().getNomeCompleto()));
        pst.setString(2, toLowerCase(usuario.getLogin()));
        pst.setString(3, usuario.getSenha());
        // Converte a data do tipo date para DateSql
        pst.setDate(4, DataUtility.dateParaDateSql(usuario.getPessoa().getDataCadastro()));
        pst.setInt(5, usuario.getPerfil().getId());
        pst.setBoolean(6, true);
        pst.execute();
    }

    
    // Método para listar usuarios que estão cadastradao no Banco de Dados
    public ArrayList<Usuario> listar() throws Exception {
        ArrayList<Usuario> listaDeUsuarios = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        
        // Looping para atribuir ao objeto lista, a lista dos usuarios do Banco de Dados
        while (lista.next()) {
            Usuario usuario = new Usuario();
            usuario.getPessoa().setId(lista.getInt("id"));
            usuario.getPessoa().setNomeCompleto(lista.getString("nomeCompleto"));
            usuario.setLogin(lista.getString("login"));
            usuario.setSenha(lista.getString("senha"));
            usuario.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            usuario.getPerfil().setId(lista.getInt("id_perfil"));
            usuario.getPerfil().setStatus(lista.getBoolean("status"));
            listaDeUsuarios.add(usuario);
        }
        return listaDeUsuarios;
    }
    
    // Método para alterar o cadastrado do usuario no Banco de Dados
    public void alterar(Usuario usuario) throws Exception {
        String sql = "UPDATE usuario SET nomeCompleto=?, login=?, senha=?, id_perfil=? WHERE id=?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(usuario.getPessoa().getNomeCompleto()));
        pst.setString(2, toLowerCase(usuario.getLogin()));
        pst.setString(3, usuario.getSenha());
        pst.setInt(4, usuario.getPerfil().getId());
        pst.setInt(5, usuario.getPessoa().getId());
        pst.execute();
    }
    
    // Método para ativar o usuario no Banco de Dados
    public void ativar(Usuario usuario) throws Exception {
        String sql = "UPDATE usuario SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, usuario.getPessoa().getId());
        pst.execute();
    }
    
    // Método para desativar o usuario no Banco de Dados
    public void desativar(Usuario usuario) throws Exception {
        String sql = "UPDATE usuario SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, usuario.getPessoa().getId());
        pst.execute();

    }
    
    // Pesquisar o usuario pelo id no banco de dados  
    public List pesquisarPorId(int id) throws Exception {
        List<Usuario> usuario = new ArrayList<Usuario>();
        String sql = "SELECT * FROM usuario WHERE id=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta o id no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            Usuario dados = new Usuario();
            dados.getPessoa().setId(lista.getInt("id"));
            dados.getPessoa().setNomeCompleto(lista.getString("nomeCompleto"));
            dados.setLogin(lista.getString("login"));
            dados.setSenha(lista.getString("senha"));
            dados.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            dados.getPerfil().setId(lista.getInt("id_perfil"));
            dados.getPessoa().setStatus(lista.getBoolean("status"));
            usuario.add(dados);
        }
        return usuario;
    }
    
    // Método para receber uma lista do Banco de Dados e validar o login e a senha
    public Usuario validarLogin(String login, String senha) throws Exception {
        String sql = "SELECT * FROM usuario WHERE login=? AND status = true";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, login);
        ResultSet lista = pst.executeQuery();
        Usuario usuario = new Usuario();
        
        if (lista.next()) {
            if (senha.equals(lista.getString("senha"))) {
                usuario.getPessoa().setId(lista.getInt("id"));
                usuario.setLogin(lista.getString("login"));
                usuario.setSenha(lista.getString("senha"));
                usuario.getPessoa().setStatus(lista.getBoolean("status"));
            }
        }
        return usuario;
    }
  
}
