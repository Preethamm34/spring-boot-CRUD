package com.pm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pm.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	@Query("SELECT c FROM Customer c JOIN FETCH c.products")
	List<Customer> findAllCustomersWithProducts();

	@Query("SELECT DISTINCT c FROM Customer c JOIN FETCH c.products p "
			+ "WHERE (:costomerId IS NULL OR c.costomerId = :costomerId) "
			+ "OR (:productId IS NULL OR p.productId = :productId)")
	List<Customer> searchAllCustomersWithProducts(@Param("costomerId") Integer costomerId,
			@Param("productId") Integer productId);

}
