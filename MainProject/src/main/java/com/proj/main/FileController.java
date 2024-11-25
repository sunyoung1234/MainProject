package com.proj.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@RequestMapping("/downLoadFile")
	public ResponseEntity<InputStreamResource> downLoadFile(@RequestParam String fileName){
		
		try {
			fileName = URLDecoder.decode(fileName, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			return ResponseEntity.badRequest().body(null);
		}
		
		File file = new File(uploadPath + File.separator + fileName);
		
		if(!file.exists()) {
			return ResponseEntity.notFound().build();
		} 
		
		FileInputStream fileInputStream;
		try {
			fileInputStream = new FileInputStream(file);
			InputStreamResource resource = new InputStreamResource(fileInputStream);
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; fileName=" + file.getName())
					.contentType(getMediaType(file.getName()))
					.contentLength(file.length())
					.body(resource);
		} catch (FileNotFoundException e) {
			return ResponseEntity.notFound().build();
		}
		
		
	}
	
    private MediaType getMediaType(String filename) {
        if (filename.endsWith(".pdf")) {
            return MediaType.APPLICATION_PDF;
        } else if (filename.endsWith(".xls") || filename.endsWith(".xlsx") || filename.endsWith(".xlsm")) {
            return MediaType.APPLICATION_OCTET_STREAM; // ø¢ºø MIME ≈∏¿‘
        }
        return MediaType.APPLICATION_OCTET_STREAM; // ±‚∫ª MIME ≈∏¿‘
    }
}
