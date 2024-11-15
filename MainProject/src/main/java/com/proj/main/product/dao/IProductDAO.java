package com.proj.main.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.product.dto.ProductDTO;

@Mapper
public interface IProductDAO {
	
	// 제품 리스트 가져오기
	List<ProductDTO> productList(String category);

	// 제품 가져오기
	ProductDTO getProduct(ProductDTO product);
	
}
