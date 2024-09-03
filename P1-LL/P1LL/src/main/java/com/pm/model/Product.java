package com.pm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String name;
	private String qty;
	private String units;
	private String price;
	private String discriptions;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "costomerId")
	private Customer customer;

	public int getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDiscriptions() {
		return discriptions;
	}

	public void setDiscriptions(String discriptions) {
		this.discriptions = discriptions;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", qty=" + qty + ", units=" + units + ", price="
				+ price + ", discriptions=" + discriptions + ", customer=" + customer + "]";
	}

	public Product(Integer productId, String name, String qty, String units, String price, String discriptions,
			Customer customer) {
		super();
		this.productId = productId;
		this.name = name;
		this.qty = qty;
		this.units = units;
		this.price = price;
		this.discriptions = discriptions;
		this.customer = customer;
	}

	public Product() {
		super();
	}

}
