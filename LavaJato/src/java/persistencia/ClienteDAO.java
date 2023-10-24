
package persistencia;

import DataUtility.DataUtility;
import entidade.Cliente;
import java.sql.*;
import java.util.*;


public class ClienteDAO extends ConexaoComBancoDeDados {
    
    public ClienteDAO() throws Exception {
    }
    
    // Método para inserir o cliente no Banco de Dados
    public void cadastrar(Cliente cliente) throws Exception {
        String sql = "INSERT INTO cliente (nome, sobrenome, telefone, dataCadastro, status) VALUES(?, ?, ?, ?, ?)";
        // Além do comando SQL, ele irá retornar qual o n° do ID gerado
        PreparedStatement pst = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, cliente.getPessoa().getNome());
        pst.setString(2, cliente.getPessoa().getSobrenome());
        pst.setString(3, cliente.getTelefone());
        pst.setDate(4, DataUtility.dateParaDateSql(cliente.getPessoa().getDataCadastro()));
        pst.setBoolean(5, true);
        pst.execute();
        
        // Após a execução do 'execute()'
        ResultSet generatedKeys = pst.getGeneratedKeys();
        if (generatedKeys.next()) {
            cliente.setIdGerado(generatedKeys.getInt(1)); // Retorna o valor da 1° coluna
        }

    }
    
    // Método para listar clientes que estão no Banco de Dados
    public ArrayList<Cliente> listar() throws Exception {
        ArrayList<Cliente> listaDeCliente = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista dos funcionarios
        while (lista.next()) {
            Cliente cliente = new Cliente();
            cliente.getPessoa().setId(lista.getInt("id"));
            cliente.getPessoa().setNome(lista.getString("nome"));
            cliente.getPessoa().setSobrenome(lista.getString("sobrenome"));
            cliente.setTelefone(lista.getString("telefone"));
            cliente.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            cliente.getPessoa().setStatus(lista.getBoolean("status"));
            listaDeCliente.add(cliente);
        }
        return listaDeCliente;
    }
    
    // Método para alterar o cliente no Banco de Dados
    public void alterar(Cliente cliente) throws Exception {
        String sql = "UPDATE cliente SET nome=?, sobrenome=?, telefone=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, cliente.getPessoa().getNome());
        pst.setString(2, cliente.getPessoa().getSobrenome());
        pst.setString(3, cliente.getTelefone());
        pst.setInt(4, cliente.getPessoa().getId());
        pst.execute();
    }
    
    // Método para ativar cliente no Banco de Dados
    public void ativar(Cliente cliente) throws Exception {
        String sql = "UPDATE cliente SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, cliente.getPessoa().getId());
        pst.execute();
    }
    
    // Método para desativar cliente no Banco de Dados
    public void desativar(Cliente cliente) throws Exception {
        String sql = "UPDATE cliente SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, cliente.getPessoa().getId());
        pst.execute();

    }
    
    // Método para pesquisar o cliente pelo identificador no Banco de Dados
    public Cliente pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM cliente WHERE id = " + id;
        Statement stm = conexao.createStatement();
        Cliente cliente = new Cliente();
        ResultSet lista;

        lista = stm.executeQuery(sql);
        if (lista.next()) {;
            cliente.getPessoa().setId(lista.getInt("id"));
            cliente.getPessoa().setNome(lista.getString("nome"));
            cliente.getPessoa().setSobrenome(lista.getString("sobrenome"));
            cliente.setTelefone(lista.getString("telefone"));
            cliente.getPessoa().setDataCadastro(lista.getDate("dataCadastro"));
            cliente.getPessoa().setStatus(lista.getBoolean("status"));
        }
        return cliente;
    }
    
}
