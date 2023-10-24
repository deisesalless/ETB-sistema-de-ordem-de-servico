
package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import lombok.*;


@Getter
public class ConexaoComBancoDeDados {
    
    //Driver JDBC
    public static  final String DRIVER = "com.mysql.jdbc.Driver";
    
    //URL de conexao com o banco
    public static  final String URL = "jdbc:mysql://localhost:3306/bd-lavajato2";
    
    //Usuario do banco
    private static  final String DB_USER = "root";
    
    //Senha do banco
    private static  final String DB_SENHA = "";
    
    //Objeto de conexao
    protected Connection conexao;
    
    //Inicializa uma instância do DAO
    public ConexaoComBancoDeDados() throws Exception {
        //Tenta carregar o Driver
        Class.forName(DRIVER);
    }
    
    //Obtem a conexao via JDBC
    public void conectar() throws SQLException{
        conexao = DriverManager.getConnection(URL, DB_USER, DB_SENHA);
    }
    
    //Fecha a conexao
    public void desconectar() throws SQLException {
        //verifica se esta conectado
        if(conexao != null){
            conexao.close();
        }else{
            //Se a conexao ja estiver fechada envia mensagem de erro
            throw new SQLException("A conexão já está fechada!");
        }
    }
    
}
