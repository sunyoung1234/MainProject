package com.proj.main;

import java.util.Base64;

import org.springframework.web.multipart.MultipartFile;

public class Base64ToMultipartFile {

    public static MultipartFile convert(String base64Image, String filename) {
        try {
            String[] parts = base64Image.split(",");
            String data = parts[1]; // Base64 데이터만 추출
            byte[] decodedBytes = Base64.getDecoder().decode(data);

            return new Base64DecodedMultipartFile(decodedBytes, filename, "image/png");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}