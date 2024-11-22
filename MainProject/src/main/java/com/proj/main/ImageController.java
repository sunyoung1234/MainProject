package com.proj.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController{
	@Autowired
	FileUpload fileUpload;
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	@RequestMapping("/displayImage")
	public ResponseEntity<byte[]> displayImage(String imgName){
		InputStream inputStream = null;
		ResponseEntity<byte[]> entity = null;
		
		String imgPath = uploadPath + File.separator + imgName;
		 
		MediaType mediaType = MediaType.IMAGE_JPEG;
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		
		
		try {
			inputStream = new FileInputStream(imgPath);
			
			try {
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.CREATED);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			 System.err.println("File not found: " + imgPath);
		} finally {
			if(inputStream != null) {
				try {inputStream.close();} catch(IOException e) {}
			}
		}
		
		return entity;
	}
}