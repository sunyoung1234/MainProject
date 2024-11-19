package com.proj.main;

import java.lang.reflect.Field;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ReflectionMapper {

	public static <T> T mapJsonToDto(String jsonString, Class<T> clazz) throws Exception {
        // 1. JSON ���ڿ��� Map���� ��ȯ
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonString, Map.class);

        // 2. DTO ��ü ����
        T dto = clazz.getDeclaredConstructor().newInstance();

        // 3. Reflection�� ���� DTO �ʵ�� JSON �����͸� ���� 
        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true); // private �ʵ� ���� ���

            // JSON Map���� �ʵ� �̸��� ��ġ�ϴ� �� ã��
            if (jsonMap.containsKey(field.getName())) {
                Object value = jsonMap.get(field.getName());

                // �ʵ� Ÿ�԰� �� Ÿ���� ��ġ�ϸ� �ʵ忡 �� ����
                if (value != null && field.getType().isAssignableFrom(value.getClass())) {
                    field.set(dto, value);
                } else if (value != null && field.getType().equals(double.class) && value instanceof Number) {
                    field.set(dto, ((Number) value).doubleValue()); // double�� ��ȯ
                } else if (value != null && field.getType().equals(String.class)) {
                    field.set(dto, value.toString()); // String���� ��ȯ
                }
            }
        }

        return dto;
    }
}
