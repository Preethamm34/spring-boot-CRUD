package com.pm.service;

import java.util.List;

import com.pm.model.Customer;

public interface CustomerService {

	public Customer saveCustomer(Customer customer);
	 
	 public Customer getCustomerById(int costomerId);
	 
	 public List<Customer> getAllCustomers() ;
}
