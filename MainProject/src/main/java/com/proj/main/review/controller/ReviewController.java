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
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.CssFileImpl;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
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
				List<AttachDTO> attachList = fileUpload.getAttachListByMultiparts(files);
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
	        // PDF 설정
	        response.setContentType("application/pdf");
	        response.setHeader("Content-Disposition", "inline; filename=\"sample.pdf\"");

	        // Document 객체 생성
	        Document document = new Document();
	        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
	        document.open();

	        // HTML 코드 정의
	        String html = "<html><head>" +
	                      "<style>" +
	                      "h1 { font-family: 'malgun'; }" +
	                      "p { font-family: 'malgun'; }" +
	                      "</style>" +
	                      "</head><body>" +
	                      "<h1>4팀 팀장 박선영</h1>" +
	                      "<p>This is a <b>bold</b> paragraph.</p>" +
	                      "<p style='color: red;'>This text is red (if supported).</p>" +
	                      "</body></html>";

	        
	        // 한글 폰트 설정
	        String fontPath = new ClassPathResource("C:\\Users\\302-1\\git\\MainProject\\MainProject\\src\\main\\webapp\\resources\\fonts\\MALGUN.TTF").getPath();
	        XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
	        fontProvider.register(fontPath, "malgun"); // 폰트 등록
	        
	        
	        // XMLWorker를 사용하여 HTML을 PDF로 변환
	        XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
	        helper.parseXHtml(writer, document, new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)), null, StandardCharsets.UTF_8, fontProvider);

	        String imagePath = servletContext.getRealPath("/resources/image/zeb2.png");
	        Image image = Image.getInstance(imagePath);
	        
	        // 이미지 크기 및 위치 설정 (필요에 따라 조정)
	        image.scaleToFit(200, 200); // 이미지 크기 조정
	        image.setAlignment(Image.ALIGN_CENTER); // 이미지 가운데 정렬

	        document.add(image); // PDF에 이미지 추가
	        

	        document.close();
	    }
}
