
package persistencia;

import DataUtility.DataUtility;
import entidade.Funcionario;
import java.sql.*;
import java.util.*;


public class FuncionarioDAO extends ConexaoComBancoDeDados {
    
    public FuncionarioDAO() throws Exception {
    }
    
    // Método para inserir o funcionario no Banco de Dados
    public void cadastrar(Funcionario funcionario) throws Exception {
        String sql = "INSERT INTO funcionario (nome, sobrenome, apelido, telefone, dataCadastro, id_perfil, status) VALUES(?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, funcionario.getPessoa().getNome());
        pst.setString(2, funcionario.getPessoa().getSobrenome());
        pst.setString(3, funcionario.getApelido());
        pst.setString(4, funcionario.getTelefone());
        pst.setDate(5, DataUtility.dateParaDateSql(funcionario.getPessoa().getDataCadastro()));
        pst.setInt(6, funcionario.getPerfil().getId());
        pst.setBoolean(7, true);
        pst.execute();
    }
    
    // Método para listar funcionarios que estão no Banco de Dados
    public ArrayList<Funcionario> listar() throws Exception {
        ArrayList<Funcionario> listaDeFuncionario = new ArrayList<Funcionario>();
        String sql = "SELECT * FROM funcionario";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista dos funcionarios
        while (lista.next()) {
            Funcionario funcionario = new Funcionario();
            funcionario.getPessoa().setId(lista.getInt("id"));
            funcionario.getPessoa().setNome(lista.getString("nome"));
            funcionario.getPessoa().setSobrenome(lista.getString("sobrenome"));
            funcionario.setApelido(lista.getString("apelido"));
            funcionario.setTelefone(lista.getString("telefone"));
            funcionario.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            funcionario.getPerfil().setId(lista.getInt("id_perfil"));
            funcionario.getPerfil().setStatus(lista.getBoolean("status"));
            listaDeFuncionario.add(funcionario);
        }
        return listaDeFuncionario;
    }
    
    // Método para alterar o funcionario no Banco de Dados
    public void alterar(Funcionario funcionario) throws Exception {
        String sql = "UPDATE funcionario SET nome=?, sobrenome=?, apelido=?, telefone=?, id_perfil=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, funcionario.getPessoa().getNome());
        pst.setString(2, funcionario.getPessoa().getSobrenome());
        pst.setString(3, funcionario.getApelido());
        pst.setString(4, funcionario.getTelefone());
        pst.setInt(5, funcionario.getPerfil().getId());
        pst.setInt(6, funcionario.getPessoa().getId());
        pst.execute();
    }
    
    // Método para ativar funcionario no Banco de Dados
    public void ativar(Funcionario funcionario) throws Exception {
        String sql = "UPDATE funcionario SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, funcionario.getPessoa().getId());
        pst.execute();
    }
    
    // Método para desativar funcionario no Banco de Dados
    public void desativar(Funcionario funcionario) throws Exception {
        String sql = "UPDATE funcionario SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, funcionario.getPessoa().getId());
        pst.execute();

    }
    
    // Método para pesquisar o funcionario pelo identificador no Banco de Dados
    public Funcionario pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM funcionario WHERE id = " + id;
        Statement stm = conexao.createStatement();
        Funcionario funcionario = new Funcionario();
        ResultSet lista = stm.executeQuery(sql);

        if (lista.next()) {;
            funcionario.getPessoa().setId(lista.getInt("id"));
            funcionario.getPessoa().setNome(lista.getString("nome"));
            funcionario.getPessoa().setSobrenome(lista.getString("sobrenome"));
            funcionario.setApelido(lista.getString("apelido"));
            funcionario.setTelefone(lista.getString("telefone"));
            funcionario.getPerfil().setId(lista.getInt("id_perfil"));
            funcionario.getPessoa().setStatus(lista.getBoolean("status"));
        }
        return funcionario;
    }
    
    
}
