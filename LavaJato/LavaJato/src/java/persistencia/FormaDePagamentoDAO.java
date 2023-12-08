
package persistencia;

import entidade.FormaDePagamento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import static org.apache.taglibs.standard.functions.Functions.toLowerCase;


public class FormaDePagamentoDAO extends ConexaoComBancoDeDados {
    
    public FormaDePagamentoDAO() throws Exception {
    }
    
    // Método para cadastrar a forma de pagamento no banco de dados
    public void cadastrar(FormaDePagamento formaDePagamento) throws Exception {
        String sql = "INSERT INTO tipo_pagamento (nome, status) VALUES(?,?)";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toLowerCase(formaDePagamento.getServicoPreco().getNome()));
        pst.setBoolean(2, true);
        pst.execute();
    }
    
    // Método para listar as formas de pagamentos que estão cadastradas no banco de dados
    public ArrayList<FormaDePagamento> listar() throws Exception {
        ArrayList<FormaDePagamento> listaFormaDePagamento = new ArrayList<FormaDePagamento>();
        String sql = "SELECT * FROM tipo_pagamento";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        // Looping para atribuir ao objeto lista, a lista de formas de pagamentos
        while (lista.next()) {
            FormaDePagamento formaDePagamento = new FormaDePagamento();
            formaDePagamento.getServicoPreco().setId(lista.getInt("id"));
            formaDePagamento.getServicoPreco().setNome(lista.getString("nome"));
            formaDePagamento.getServicoPreco().setStatus(lista.getBoolean("status"));
            listaFormaDePagamento.add(formaDePagamento);
        }
        // Retorna a lista de formas de pagamentos que estão ativados e desativados no banco de dados
        return listaFormaDePagamento;
    }
    
    // Método para alterar forma de pagamento no Banco de Dados
    public void alterar(FormaDePagamento formaDePagamento) throws Exception {
        String sql = "UPDATE tipo_pagamento SET nome=? WHERE id = ?";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setString(1, toLowerCase(formaDePagamento.getServicoPreco().getNome()));
        pst.setInt(2, formaDePagamento.getServicoPreco().getId());
        pst.execute();
    }
    
    // Método para ativar forma de pagamento no Banco de Dados
    public void ativar(FormaDePagamento formaDePagamento) throws Exception {
        String sql = "UPDATE tipo_pagamento SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, formaDePagamento.getServicoPreco().getId());
        pst.execute();
    }
    
    // Método para desativar forma de pagamento no Banco de Dados
    public void desativar(FormaDePagamento formaDePagamento) throws Exception {
        String sql = "UPDATE tipo_pagamento SET status=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, formaDePagamento.getServicoPreco().getId());
        pst.execute();
    }
    
    // Método para pesquisar a forma de pagamento por Id no Banco de Dados
    public List pesquisarPorId(int id) throws Exception {
        List<FormaDePagamento> formaDePagamento = new ArrayList<FormaDePagamento>();
        String sql = "SELECT * FROM tipo_pagamento WHERE id=?";
        PreparedStatement pstm = getConexao().prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet lista = pstm.executeQuery();
        
        // Consulta o id no banco de dados e retorna a lista com todas as informações
        while (lista.next()) {
            FormaDePagamento dados = new FormaDePagamento();
            dados.getServicoPreco().setId(lista.getInt("id"));
            dados.getServicoPreco().setNome(lista.getString("nome"));
            dados.getServicoPreco().setStatus(lista.getBoolean("status"));
            formaDePagamento.add(dados);
        }
        return formaDePagamento;
    }
}