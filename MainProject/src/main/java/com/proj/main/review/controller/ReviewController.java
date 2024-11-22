package com.proj.main.review.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.proj.main.FileUpload;
import com.proj.main.attach.dto.AttachDTO;
import com.proj.main.attach.service.AttachService;
import com.proj.main.member.dto.MemberDTO;
import com.proj.main.review.dto.ReviewDTO;
import com.proj.main.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
    private ServletContext servletContext;
	
	@Autowired
	ReviewService rs;
	
	@Autowired
	FileUpload fileUpload;
	
	@Autowired
	AttachService attachService;
	
	@RequestMapping("/reviewView")
	public String reviewView() {
		
		
		
		
		return "review/reviewView";
	}
	
	@RequestMapping("/reviewWriteView")
	public String reviewWriteView() {
		return "review/reviewWriteView";
	}
	
	@RequestMapping("/reviewWriteDo")
	public String reviewWriteDo(ReviewDTO review, MultipartFile[] files, HttpSession session) {
		
		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		String memId = mem.getMemId();
		review.setMemId(memId); 
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMddHHmmssSSS");
		String writeDate = sdf.format(date);
		String reviewId	= sdf2.format(date) + memId; 
		review.setRevDate(writeDate);
		review.setRevId(reviewId);
		
		String imgPath = null;
		List<String> pathList = new ArrayList<>();
		
		try {
			if(files.length > 0) {
				List<AttachDTO> attachList = fileUpload.getAttachListByMultiparts(files,"JPEG");
				for(AttachDTO attach : attachList) {
					imgPath = attach.getAtchPath().substring(11);
					attachService.insertAttach(attach);
					pathList.add(imgPath);
				}
				ObjectMapper objectMapper = new ObjectMapper();
				String pathListJson = objectMapper.writeValueAsString(pathList);
				review.setRevFile("{" +pathListJson + "}");
				
			}			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "redirect:/reviewWriteView";
		}
		
		rs.insertReview(review);
		
		return "redirect:/reviewView";
	}
	
	@GetMapping("/pdf")
	public void generatePdf(HttpServletResponse response) throws DocumentException, IOException {
	    // PDF ����
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition", "inline; filename=\"sample.pdf\"");

	    // Document ��ü ����
	    Document document = new Document();
	    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
	    document.open();

	    // HTML �ڵ� ����
	    String html = "<html><head>" +
	                  "<style>" +
	                  "h1 { font-family: 'malgun'; }" +
	                  "p { font-family: 'malgun'; }" +
	                  "</style>" +
	                  "</head><body>" +
	                  "<h1>4�� ���� �ڼ���</h1>" +
	                  "<p>This is a <b>bold</b> paragraph.</p>" +
	                  "<p style='color: red;'>This text is red (if supported).</p>" +
	                  "</body></html>";

	    // �ѱ� ��Ʈ ����
	    String fontPath = new ClassPathResource("C:\\Users\\302-1\\git\\MainProject\\MainProject\\src\\main\\webapp\\resources\\fonts\\MALGUN.TTF").getPath();
	    XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
	    fontProvider.register(fontPath, "malgun"); // ��Ʈ ���
	    Font malgunFont = fontProvider.getFont("malgun", BaseFont.IDENTITY_H, 12); // "malgun" ��Ʈ ����

	    // XMLWorker�� ����Ͽ� HTML�� PDF�� ��ȯ
	    XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
	    helper.parseXHtml(writer, document, new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)), null, StandardCharsets.UTF_8, fontProvider);

	    String imagePath = servletContext.getRealPath("/resources/image/zeb2.png");
	    Image image = Image.getInstance(imagePath);

	    // �̹��� ũ�� �� ��ġ ���� (�ʿ信 ���� ����)
	    image.scaleToFit(200, 200); // �̹��� ũ�� ����
	    image.setAlignment(Image.ALIGN_CENTER); // �̹��� ��� ����

	    document.add(image); // PDF�� �̹��� �߰�

	    // ǥ ����
	    PdfPTable table = new PdfPTable(3); // 3��¥�� ǥ ����
	    table.setWidthPercentage(30); // ǥ �ʺ� ������ �ʺ� ����
	    float[] columnWidths = {2, 5, 3}; // �� �ʺ� ���� ����
	    table.setWidths(columnWidths);

	    // ǥ�� ������ �߰� (�� ���� malgunFont ����)
	    addCell(table, "���漺��\n(����/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
	    addCell(table, "aaa", Element.ALIGN_CENTER, 1, null, malgunFont);

	    addCell(table, "���濡���� �䱸��\n(kWh/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
	    addCell(table, "aaa", Element.ALIGN_CENTER, 1, null, malgunFont);

	    addCell(table, "�ù濡���� �䱸��\n(kWh/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "����������", Element.ALIGN_RIGHT, 1, BaseColor.WHITE, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 2, null, malgunFont);

        addCell(table, "����������", Element.ALIGN_RIGHT, 1, BaseColor.WHITE, malgunFont);
        addCell(table, "aaa", Element.ALIGN_CENTER, 2, null, malgunFont);

        addCell(table, "������� (W/��)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "�ù���� (W/��)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "aaa", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "��������", Element.ALIGN_RIGHT, 1, BaseColor.WHITE, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 2, null, malgunFont);

        addCell(table, "��������", Element.ALIGN_RIGHT, 1, BaseColor.WHITE, malgunFont);
        addCell(table, "aaa", Element.ALIGN_CENTER, 2, null, malgunFont);

        addCell(table, "������ �ҿ䷮\n(kWh/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "������ ���(��/yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "aaa", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "CO2 ���ⷮ\n(kg/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "bbb", Element.ALIGN_CENTER, 1, null, malgunFont);

        addCell(table, "1�������� �ҿ䷮\n(kWh/����yr)", Element.ALIGN_CENTER, 2, BaseColor.LIGHT_GRAY, malgunFont);
        addCell(table, "aa", Element.ALIGN_CENTER, 1, null, malgunFont);

	    document.add(table); // ǥ�� ������ �߰�
	    
	    document.close();
	}

	// �� �߰� �޼���
	private static void addCell(PdfPTable table, String text, int alignment, int colspan, BaseColor bgColor, Font font) {
	    PdfPCell cell = new PdfPCell(new Phrase(text, font)); // ���޹��� Font ����
	    cell.setHorizontalAlignment(alignment);
	    cell.setColspan(colspan);
	    if (bgColor != null) {
	        cell.setBackgroundColor(bgColor);
	    }
	    table.addCell(cell);
	}

}
