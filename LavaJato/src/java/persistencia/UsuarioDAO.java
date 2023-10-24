
package persistencia;

import DataUtility.DataUtility;
import entidade.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;



public class UsuarioDAO extends ConexaoComBancoDeDados {
        
    public UsuarioDAO() throws Exception {
    }
    
    // Método para inserir a usuario no Banco de Dados
    public void cadastrar(Usuario usuario) throws Exception {
        String sql = "INSERT INTO usuario (nome, sobrenome, login, senha, dataCadastro, id_perfil, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, usuario.getPessoa().getNome());
        pst.setString(2, usuario.getPessoa().getSobrenome());
        pst.setString(3, usuario.getLogin());
        pst.setString(4, usuario.getSenha());
        // Converte a data do tipo date para DateSql
        pst.setDate(5, DataUtility.dateParaDateSql(usuario.getPessoa().getDataCadastro()));
        pst.setInt(6, usuario.getPerfil().getId());
        pst.setBoolean(7, true);
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
            usuario.getPessoa().setNome(lista.getString("nome"));
            usuario.getPessoa().setSobrenome(lista.getString("sobrenome"));
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
    public void alterarCadastro(Usuario usuario) throws Exception {
        String sql = "UPDATE usuario SET nome=?, sobrenome=?, id_perfil=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, usuario.getPessoa().getNome());
        pst.setString(2, usuario.getPessoa().getSobrenome());
        pst.setInt(3, usuario.getPerfil().getId());
        pst.setInt(4, usuario.getPessoa().getId());
        pst.execute();
    }
    
    // Método para alterar o usuario e senha no Banco de Dados
    public void alterarLoginSenha(Usuario usuario) throws Exception {
        String sql = "UPDATE usuario SET login=?, senha=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, usuario.getLogin());
        pst.setString(2, usuario.getSenha());
        pst.setInt(3, usuario.getPessoa().getId());
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
    public Usuario pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM usuario WHERE id = " + id;
        Statement stm = conexao.createStatement();
        ResultSet lista = stm.executeQuery(sql);
        Usuario usuario = new Usuario();

        if (lista.next()) {
            usuario.getPessoa().setId(lista.getInt("id"));
            usuario.getPessoa().setNome(lista.getString("nome"));
            usuario.getPessoa().setSobrenome(lista.getString("sobrenome"));
            usuario.setLogin(lista.getString("login"));
            usuario.setSenha(lista.getString("senha"));
            usuario.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            usuario.getPerfil().setId(lista.getInt("id_perfil"));
            usuario.getPessoa().setStatus(lista.getBoolean("status"));
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