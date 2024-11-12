package com.proj.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

@Component("pdfView")
public class PdfView extends AbstractPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, 
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        List<String> list = (List<String>) model.get("list");
        
        Table table = new Table(1, list.size() + 1);
        table.setPadding(5);
        
        BaseFont bfKorea = BaseFont.createFont("C:\\Windows\\Fonts\\malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bfKorea);
        
        Cell cell = new Cell(new Paragraph("데이터 처리에 많이 사용되는 언어", font)); 
        cell.setHeader(true);
        table.addCell(cell);
        table.endHeaders();
        
        for (String language : list) {
            Cell imsi = new Cell(new Paragraph(language, font));
            table.addCell(imsi);
        }
        
        doc.add(table);
    }
}
