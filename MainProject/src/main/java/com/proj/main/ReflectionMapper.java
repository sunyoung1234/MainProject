package com.proj.main;

import java.lang.reflect.Field;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ReflectionMapper {

	public static <T> T mapJsonToDto(String jsonString, Class<T> clazz) throws Exception {
        // 1. JSON 문자열을 Map으로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonString, Map.class);

        // 2. DTO 객체 생성
        T dto = clazz.getDeclaredConstructor().newInstance();

        // 3. Reflection을 통해 DTO 필드와 JSON 데이터를 매핑 
        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true); // private 필드 접근 허용

            // JSON Map에서 필드 이름과 일치하는 값 찾기
            if (jsonMap.containsKey(field.getName())) {
                Object value = jsonMap.get(field.getName());

                // 필드 타입과 값 타입이 일치하면 필드에 값 설정
                if (value != null && field.getType().isAssignableFrom(value.getClass())) {
                    field.set(dto, value);
                } else if (value != null && field.getType().equals(double.class) && value instanceof Number) {
                    field.set(dto, ((Number) value).doubleValue()); // double로 변환
                } else if (value != null && field.getType().equals(String.class)) {
                    field.set(dto, value.toString()); // String으로 변환
                }
            }
        }

        return dto;
    }
}
