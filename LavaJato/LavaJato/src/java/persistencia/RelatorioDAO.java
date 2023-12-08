
package persistencia;

import entidade.Atendimento;
import entidade.FluxoDeCaixa;
import entidade.FormaDePagamento;
import entidade.Funcionario;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class RelatorioDAO extends ConexaoComBancoDeDados {
    
    public RelatorioDAO() throws Exception {

    }
    
    
    // Método para criar o corpo do relatório
    public void gerarRelatorioEntradaFluxoDeCaixa() {
        
        // Array do cabeçalho da planilha, nome de celula
        String[] cabecalho = {"Data", "Ordem de Serviço", "Tipo de Entrada", "Valor"};
        
        Workbook workbook = new XSSFWorkbook();
        // Define o nome do arquivo
        XSSFSheet nomeArquivo = (XSSFSheet) workbook.createSheet("Fluxo De Caixa - Entrada De Valores");
        XSSFRow cabecalhoCelula = nomeArquivo.createRow(0);

        // Criando cabeçalhos para as colunas de acordo com o tamanho das celulas
        for (int i = 0; i < cabecalho.length; i++) {
            Cell cell = cabecalhoCelula.createCell(i);
            cell.setCellValue(cabecalho[i]);
        }
        
        int rowNum = 1;
        
        // Cria o corpo da tabela
        try {
            
            AtendimentoDAO atendimentoBD = new AtendimentoDAO();
            FormaDePagamentoDAO formaPagamentoDB = new FormaDePagamentoDAO();
            TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
            
            atendimentoBD.conectar();
            formaPagamentoDB.conectar();
            tabelaPrecoDB.conectar();
            
            // Lista dos atendimentos
            List<Atendimento> lista = atendimentoBD.listar();
            
            String data = "";
            int id = 0;
            String formaDePagamento = "";
            String valorTotalPreco = "";
            
            // Lista dos atendimentos
            for (Atendimento atendimento : lista) {
                if (atendimento.isStatusAtendimento() == false) {

                    // Data formatada
                    SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                    data = dataFormatada.format(atendimento.getData());
                    id = atendimento.getId();

                    // Pega o nome do tipo de entrada de valor que teve no caixa
                    ArrayList<FormaDePagamento> list = formaPagamentoDB.listar();
                    for(FormaDePagamento formaPagamento : list) {
                        if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaPagamento.getServicoPreco().getId()) {
                            formaDePagamento = formaPagamento.getServicoPreco().getNome();
                        }
                    }

                    // Valor formatado
                    DecimalFormat formato = new DecimalFormat("0.00");
                    Double precoValorTotal = atendimento.getValorTotal();
                    valorTotalPreco = formato.format(precoValorTotal);

                    // Preenche as células com os dados correspondentes, de acordo com a ordem do cabeçalho
                    XSSFRow dadoLinha = nomeArquivo.createRow(rowNum++);
                    dadoLinha.createCell(0).setCellValue(data);
                    dadoLinha.createCell(1).setCellValue(id);
                    dadoLinha.createCell(2).setCellValue(formaDePagamento);
                    dadoLinha.createCell(3).setCellValue(valorTotalPreco);
                }
            }
            
            // Salvando o arquivo
            FileOutputStream fileOut = new FileOutputStream("C:\\Users\\lucil\\Downloads\\Fluxo De Caixa - Entrada De Valores.xlsx");
            workbook.write(fileOut);
            fileOut.close();
            
            atendimentoBD.desconectar();
            formaPagamentoDB.desconectar();
            tabelaPrecoDB.desconectar();
            
        } catch (Exception erro) {
            System.out.println(erro);
        }
    }
    
    // Método para criar o corpo do relatório
    public void gerarRelatorioSaidaFluxoDeCaixa() {
        
        // Array do cabeçalho da planilha, nome de celula
        String[] cabecalho = {"Data", "Descrição", "Valor"};
        
        Workbook workbook = new XSSFWorkbook();
        // Define o nome do arquivo
        XSSFSheet nomeArquivo = (XSSFSheet) workbook.createSheet("Fluxo De Caixa - Saida De Valores");
        XSSFRow cabecalhoCelula = nomeArquivo.createRow(0);

        // Criando cabeçalhos para as colunas de acordo com o tamanho das celulas
        for (int i = 0; i < cabecalho.length; i++) {
            Cell cell = cabecalhoCelula.createCell(i);
            cell.setCellValue(cabecalho[i]);
        }
        
        int rowNum = 1;
        
        // Cria o corpo da tabela
        try {
            
            FluxoDeCaixaDAO fluxoDeCaixaDB = new FluxoDeCaixaDAO();
            fluxoDeCaixaDB.conectar();
            
            // Lista dos atendimentos
            List<FluxoDeCaixa> lista = fluxoDeCaixaDB.listar();
            
            String data = "";
            String descricao = "";
            String valorTotalPreco = "";
            
            // Lista dos atendimentos
            for (FluxoDeCaixa fluxoDeCaixa : lista) {

                // Data formatada
                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                data = dataFormatada.format(fluxoDeCaixa.getData());
                descricao = fluxoDeCaixa.getDescricao();


                // Valor formatado
                DecimalFormat formato = new DecimalFormat("0.00");
                Double precoValorTotal = fluxoDeCaixa.getValor();
                valorTotalPreco = formato.format(precoValorTotal);

                // Preenche as células com os dados correspondentes, de acordo com a ordem do cabeçalho
                XSSFRow dadoLinha = nomeArquivo.createRow(rowNum++);
                dadoLinha.createCell(0).setCellValue(data);
                dadoLinha.createCell(1).setCellValue(descricao);
                dadoLinha.createCell(2).setCellValue(valorTotalPreco);
            }
            
            // Salvando o arquivo
            FileOutputStream fileOut = new FileOutputStream("C:\\Users\\lucil\\Downloads\\Fluxo De Caixa - Saida De Valores.xlsx");
            workbook.write(fileOut);
            fileOut.close();
            
            fluxoDeCaixaDB.desconectar();
            
        } catch (Exception erro) {
            System.out.println(erro);
        }
    }
    
    // Método para criar o corpo do relatório
    public void gerarRelatorioProdutividade() {
        
        // Array do cabeçalho da planilha, nome de celula
        String[] cabecalho = {"Data", "Nome Completo", "Apelido", "Ordem de Serviço", "Valor da OS"};
        
        Workbook workbook = new XSSFWorkbook();
        // Define o nome do arquivo
        XSSFSheet nomeArquivo = (XSSFSheet) workbook.createSheet("Relatorio de Produtividade por Funcionario");
        XSSFRow cabecalhoCelula = nomeArquivo.createRow(0);

        // Criando cabeçalhos para as colunas de acordo com o tamanho das celulas
        for (int i = 0; i < cabecalho.length; i++) {
            Cell cell = cabecalhoCelula.createCell(i);
            cell.setCellValue(cabecalho[i]);
        }
        
        int rowNum = 1;
        
        // Cria o corpo da tabela
        try {
            
            AtendimentoDAO atendimentoDB = new AtendimentoDAO();
            FuncionarioDAO funcionarioDB = new FuncionarioDAO();
            atendimentoDB.conectar();
            funcionarioDB.conectar();
            
            // Lista dos atendimentos
            List<Atendimento> lista = atendimentoDB.listar();
            
            String data = "";
            String nome = "";
            String apelido = "";
            int id;
            String valorTotalPreco = "";
            
            // Lista dos atendimentos
            for (Atendimento atendimento : lista) {

                // Data formatada
                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                data = dataFormatada.format(atendimento.getData());
                id = atendimento.getId();

                // Valor formatado
                DecimalFormat formato = new DecimalFormat("0.00");
                Double precoValorTotal = atendimento.getValorTotal();
                valorTotalPreco = formato.format(precoValorTotal);
                
                // Pega as informações do funcionário que estão vinculados a este atendimento
                ArrayList<Funcionario> list = funcionarioDB.listar();
                for(Funcionario funcionario : list) {
                    if (atendimento.getFuncionario().getPessoa().getId() == funcionario.getPessoa().getId()) {
                        apelido = funcionario.getApelido();
                        nome = funcionario.getPessoa().getNomeCompleto();
                    }
                }

                // Preenche as células com os dados correspondentes, de acordo com a ordem do cabeçalho
                XSSFRow dadoLinha = nomeArquivo.createRow(rowNum++);
                dadoLinha.createCell(0).setCellValue(data);
                dadoLinha.createCell(1).setCellValue(nome);
                dadoLinha.createCell(2).setCellValue(apelido);
                dadoLinha.createCell(3).setCellValue(id);
                dadoLinha.createCell(4).setCellValue(valorTotalPreco);
            }
            
            // Salvando o arquivo
            FileOutputStream fileOut = new FileOutputStream("C:\\Users\\lucil\\Downloads\\Relatorio de Produtividade por Funcionario.xlsx");
            workbook.write(fileOut);
            fileOut.close();
            
            atendimentoDB.desconectar();
            funcionarioDB.desconectar();
            
        } catch (Exception erro) {
            System.out.println(erro);
        }
    }
}

