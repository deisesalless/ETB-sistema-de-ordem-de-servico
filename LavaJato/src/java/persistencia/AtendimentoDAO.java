
package persistencia;

import entidade.Atendimento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AtendimentoDAO extends ConexaoComBancoDeDados {
    
    public AtendimentoDAO() throws Exception {

    }
    
    public void cadastrar(Atendimento atendimento) throws Exception{
        String sql = "INSERT INTO atendimento (data, statusAtendimento, statusPagamento, valorTotal, observacao, id_usuario, "
                + "id_cliente, id_veiculo, id_funcionario, id_forma_pagamento) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement pst = conexao.prepareStatement(sql);
        
        // Cria um objeto Timestamp utilizando o método getTime() do objeto Date
        Timestamp timestamp = new Timestamp(atendimento.getData().getTime());
        pst.setTimestamp(1, timestamp);
        pst.setBoolean(2, true);
        pst.setBoolean(3, atendimento.isStatusPagamento());
        pst.setDouble(4, atendimento.getValorTotal());
        pst.setString(5, atendimento.getObservacao());        
        pst.setInt(6, atendimento.getUsuario().getPessoa().getId());        
        pst.setInt(7, atendimento.getCliente().getPessoa().getId());
        pst.setInt(8, atendimento.getVeiculo().getId());
        pst.setInt(9, atendimento.getFuncionario().getPessoa().getId());
        pst.setInt(10, atendimento.getFormaDePagamento().getServicoPreco().getId());
        pst.execute();
 
    }
    
    public List<Atendimento> listar() throws Exception {
        List<Atendimento> listaDeAtendimentos = new ArrayList<Atendimento>();
        String sql = "SELECT * FROM atendimento";
        PreparedStatement pst = conexao.prepareStatement(sql);
        ResultSet lista = pst.executeQuery();
        
        while (lista.next()) {
            Atendimento atendimento = new Atendimento();
            atendimento.setId(lista.getInt("id"));
            atendimento.setData(lista.getTimestamp("data"));
            atendimento.setStatusAtendimento(lista.getBoolean("statusAtendimento"));
            atendimento.setStatusPagamento(lista.getBoolean("statusPagamento"));
            atendimento.setValorTotal(lista.getDouble("valorTotal"));
            atendimento.setObservacao(lista.getString("observacao"));
            atendimento.getUsuario().getPessoa().setId(lista.getInt("id_usuario"));
            atendimento.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            atendimento.getVeiculo().setId(lista.getInt("id_veiculo"));
            atendimento.getFuncionario().getPessoa().setId(lista.getInt("id_funcionario"));
            atendimento.getFormaDePagamento().getServicoPreco().setId(lista.getInt("id_forma_pagamento"));
            listaDeAtendimentos.add(atendimento);
        }
        return listaDeAtendimentos;
    }
    
    
    public void desativar(Atendimento atendimento) throws Exception {
        String sql = "UPDATE atendimento SET statusAtendimento=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, atendimento.getId());
        pst.execute();
    }
    
    public void naoPagarAtendimento(Atendimento atendimento) throws Exception {
        String sql = "UPDATE atendimento SET statusPagamento=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, true);
        pst.setInt(2, atendimento.getId());
        pst.execute();
    }
    
    public void pagarAtendimento(Atendimento atendimento) throws Exception {
        String sql = "UPDATE atendimento SET statusPagamento=? WHERE id=?;";
        PreparedStatement pst = conexao.prepareStatement(sql);
        pst.setBoolean(1, false);
        pst.setInt(2, atendimento.getId());
        pst.execute();
    }
    
    public Atendimento pesquisarPorId(int id) throws Exception {
        String sql = "SELECT * FROM atendimento WHERE id = " + id;
        Statement stm = conexao.createStatement();
        Atendimento atendimento = new Atendimento();
        ResultSet lista = stm.executeQuery(sql);
        
        if (lista.next()) {
            atendimento.setId(lista.getInt("id"));
            atendimento.setData(lista.getTimestamp("data"));
            atendimento.setStatusAtendimento(lista.getBoolean("statusAtendimento"));
            atendimento.setStatusPagamento(lista.getBoolean("statusPagamento"));
            atendimento.setValorTotal(lista.getDouble("valorTotal"));
            atendimento.setObservacao(lista.getString("observacao"));
            atendimento.getUsuario().getPessoa().setId(lista.getInt("id_usuario"));
            atendimento.getCliente().getPessoa().setId(lista.getInt("id_cliente"));
            atendimento.getVeiculo().setId(lista.getInt("id_veiculo"));
            atendimento.getFuncionario().getPessoa().setId(lista.getInt("id_funcionario"));
            atendimento.getFormaDePagamento().getServicoPreco().setId(lista.getInt("id_forma_pagamento"));
        }
        return atendimento;
    }

}
