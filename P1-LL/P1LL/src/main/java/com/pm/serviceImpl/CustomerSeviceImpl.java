package com.pm.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pm.model.Customer;
import com.pm.repository.CustomerRepository;
import com.pm.service.CustomerService;

@Service
public class CustomerSeviceImpl implements CustomerService{

	@Autowired
	private CustomerRepository customerRepo;

	@Override
	public Customer saveCustomer(Customer customer) {
		return customerRepo.save(customer);
	}

	@Override
	public Customer getCustomerById(int costomerId) {
		return customerRepo.findById(costomerId).orElse(null);
	}

	@Override
	public List<Customer> getAllCustomers() {
		return customerRepo.findAll();
	}


	
	
	
}
