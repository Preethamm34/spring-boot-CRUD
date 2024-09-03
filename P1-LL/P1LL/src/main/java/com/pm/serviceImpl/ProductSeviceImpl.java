package com.pm.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pm.model.Product;
import com.pm.repository.ProductRepository;
import com.pm.service.ProductService;

@Service
public class ProductSeviceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepo;

	@Override
	public Product saveProduct(Product product) {
		return productRepo.save(product);
	}

	
	
}
