
package persistencia;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import entidade.Atendimento;
import entidade.FormaDePagamento;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class RelatorioDAO extends ConexaoComBancoDeDados {
    
    private final Document documentoPDF = new Document();
    
    public RelatorioDAO() throws Exception {

    }
    
    // Método para abrir: documentoPDF.open() , e dar nome ao relatório
    public void abrir() {
        try {
            PdfWriter.getInstance(documentoPDF, new FileOutputStream("C:\\Users\\lucil\\Downloads\\FluxoDeCaixa-EntradaDeValores.pdf"));
            documentoPDF.open();
            
        } catch (DocumentException e) {
            e.printStackTrace();
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    // Método para imprimir o PDF e fechar: documentoPDF.close()
    public void imprimir() {
    
        if (documentoPDF != null && documentoPDF.isOpen()) {
            documentoPDF.close();
        }
    }
    
    // Método para criar o corpo do relatório
    public void gerarRelatorioEntradaFluxoDeCaixa() {
        
        Paragraph tituloDoRelatorio = new Paragraph();
        tituloDoRelatorio.setAlignment(Element.ALIGN_CENTER);
        tituloDoRelatorio.add(new Chunk("FLUXO DE CAIXA - ENTRADA", new Font(Font.TIMES_ROMAN, 16)));
        documentoPDF.add(new Paragraph(tituloDoRelatorio));
        this.documentoPDF.add(new Paragraph(" "));
        
        String formaDePagamento = "";
        try {
          
        AtendimentoDAO atendimentoDB = new AtendimentoDAO();
        FormaDePagamentoDAO formaPagamentoDB = new FormaDePagamentoDAO();
        TabelaPrecoDAO tabelaPrecoDB = new TabelaPrecoDAO();
        atendimentoDB.conectar();
        formaPagamentoDB.conectar();
        tabelaPrecoDB.conectar(); 
        
        List<Atendimento> lista = atendimentoDB.listar();
        for(Atendimento atendimento : lista) {
            if (atendimento.isStatusAtendimento() == false) {
                SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy");
                String dataCadastro = dataFormatada.format(atendimento.getData());
                
                ArrayList<FormaDePagamento> list = formaPagamentoDB.listar();
                for(FormaDePagamento formaPagamento : list) {
                    if (atendimento.getFormaDePagamento().getServicoPreco().getId() == formaPagamento.getServicoPreco().getId()) {
                        formaDePagamento = formaPagamento.getServicoPreco().getNome();
                    }
                }
                
                DecimalFormat formato = new DecimalFormat("0.00");
                Double precoValorTotal = atendimento.getValorTotal();
                String valorTotalPreco = formato.format(precoValorTotal);
                
                Paragraph paragrafoFluxoCaixaEntrada = new Paragraph();
                paragrafoFluxoCaixaEntrada.add("Data:  " + dataCadastro + " - Ordem de Serviço n° "
                        + atendimento.getId() + " - Tipo de Entrada: " + formaDePagamento + " - Valor R$ " + valorTotalPreco);
                this.documentoPDF.add(paragrafoFluxoCaixaEntrada);
                this.documentoPDF.add(new Paragraph(" "));

            }
        }
        
        atendimentoDB.desconectar();
        formaPagamentoDB.desconectar();
        tabelaPrecoDB.desconectar();
            
        } catch (Exception erro) {
            System.out.println(erro);
        }
    }
    
    
}
