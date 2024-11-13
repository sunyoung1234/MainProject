package com.proj.main.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.main.product.dto.ProductDTO;

@Mapper
public interface IProductDAO {
	
	List<ProductDTO> productList(String category);

}
