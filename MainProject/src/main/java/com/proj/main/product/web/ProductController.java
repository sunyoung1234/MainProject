package com.proj.main.product.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.main.product.dto.ProductDTO;
import com.proj.main.product.service.ProductService;

@Controller
public class ProductController {
	
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/productDetailView")
	public String productDetailView(String productCategory, Model model) {
		
		List<ProductDTO> product = productService.productList(productCategory);
		
		model.addAttribute("productCategory",product);
		
		System.out.println(product);
		
		return "member/productDetailView";
	}
	
	@RequestMapping("/productDetailInView")
	public String productDetailInView(Model model, ProductDTO product) {
		
		ProductDTO getProduct = productService.getProduct(product);
		
		System.out.println(getProduct);
		model.addAttribute("getProduct",getProduct);
		
		return "member/productDetailInView";
	}
	
	

}
