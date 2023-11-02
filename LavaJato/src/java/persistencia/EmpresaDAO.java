
package persistencia;

import DataUtility.DataUtility;
import entidade.Empresa;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lombok.*;
import static org.apache.taglibs.standard.functions.Functions.toUpperCase;

@Getter
@Setter
public class EmpresaDAO extends ConexaoComBancoDeDados {
    
    public EmpresaDAO() throws Exception {
    }
    
    // Método para inserir a empresa no Banco de Dados
    public void cadastrar(Empresa empresa) throws Exception {
        String sql = "INSERT INTO empresa (cnpj, razaoSocial, nomeFantasia, responsavel, datacadastro, status) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        
        pst.setString(1, empresa.getCnpj());
        pst.setString(2, toUpperCase(empresa.getRazaoSocial()));
        pst.setString(3, toUpperCase(empresa.getNomeFantasia()));
        pst.setString(4, toUpperCase(empresa.getResponsavel()));
        // Converte a data do tipo date para DateSql
        pst.setDate(5, DataUtility.dateParaDateSql(empresa.getDataCadastro()));
        pst.setBoolean(6, true);
        pst.execute();
    }

        
    // Método para listar empresas cadastradas no Banco de Dados
    public ArrayList<Empresa> listar() throws Exception {
        ArrayList<Empresa> listaDeEmpresas = new ArrayList<Empresa>();
        String sql = "SELECT * FROM empresa";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista das empresas
        while (lista.next()) {
            Empresa empresa = new Empresa();
            empresa.setCnpj(lista.getString("cnpj"));
            empresa.setRazaoSocial(lista.getString("razaoSocial"));
            empresa.setNomeFantasia(lista.getString("nomeFantasia"));
            empresa.setResponsavel(lista.getString("responsavel"));
            empresa.setDataCadastro(lista.getDate("dataCadastro"));
            empresa.setStatus(lista.getBoolean("status"));
            listaDeEmpresas.add(empresa);
        }
        return listaDeEmpresas;
    }
    
    // Método para alterar a empresa no Banco de Dados
    public void alterar(Empresa empresa) throws Exception {
        String sql = "UPDATE empresa SET razaoSocial=?, nomeFantasia=?, responsavel=? WHERE cnpj = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toUpperCase(empresa.getRazaoSocial()));
        pst.setString(2, toUpperCase(empresa.getNomeFantasia()));
        pst.setString(3, toUpperCase(empresa.getResponsavel()));
        pst.setString(4, empresa.getCnpj());

        pst.execute();
    }
    
    // Método para ativar empresa no Banco de Dados
    public void ativar(Empresa empresa) throws Exception {
        String sql = "UPDATE empresa SET status=? WHERE cnpj=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setString(2, empresa.getCnpj());
        pst.execute();
    }
    
    // Método para desativar empresa no Banco de Dados
    public void desativar(Empresa empresa) throws Exception {
        String sql = "UPDATE empresa SET status=? WHERE cnpj=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setString(2, empresa.getCnpj());
        pst.execute();

    }
    
    // Método para pesquisar a empresa pelo CNPJ no Banco de Dados
    public List pesquisarPorCNPJ(String cnpj) throws Exception {
        // Declaração do atributo empresa como uma lista
        List<Empresa> empresa = new ArrayList<Empresa>();
        String sql = "SELECT * FROM empresa WHERE cnpj=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setString(1, cnpj);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta o CNPJ no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            Empresa dados = new Empresa();
            dados.setCnpj(lista.getString("cnpj"));
            dados.setRazaoSocial(lista.getString("razaoSocial"));
            dados.setNomeFantasia(lista.getString("nomeFantasia"));
            dados.setResponsavel(lista.getString("responsavel"));
            dados.setStatus(lista.getBoolean("status"));
            empresa.add(dados);
        }
        return empresa;
    }

}
