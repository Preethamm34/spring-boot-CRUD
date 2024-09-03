package com.pm.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer costomerId;
	private String name;
	private String phoneNum;
	private String address;
	private String city;
	private String state;
	private String zip;

	@OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Product> products = new ArrayList<Product>();

	
	@Override
	public String toString() {
		return "Customer [costomerId=" + costomerId + ", name=" + name + ", phoneNum=" + phoneNum + ", address="
				+ address + ", city=" + city + ", state=" + state + ", zip=" + zip + ", products=" + products + "]";
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(Integer costomerId, String name, String phoneNum, String address, String city, String state, String zip,
			List<Product> products) {
		super();
		this.costomerId = costomerId;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.products = products;
	}

	public int getCostomerId() {
		return costomerId;
	}

	public void setCostomerId(Integer costomerId) {
		this.costomerId = costomerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	
}
