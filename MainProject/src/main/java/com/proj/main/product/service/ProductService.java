package com.proj.main.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.main.product.dao.IProductDAO;
import com.proj.main.product.dto.ProductDTO;

@Service
public class ProductService {
	
	
	@Autowired
	IProductDAO dao;
	
	
	public List<ProductDTO> productList(String category){
		List<ProductDTO> result = dao.productList(category);
		return result;
	}
	
	public ProductDTO getProduct(ProductDTO product) {
		ProductDTO result = dao.getProduct(product);
		return result;
	}
}
