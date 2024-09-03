package com.pm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "xlsUpload")
public class ExcelUpload {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long xlsId;
	private String customerName;
	private String phoneNum;
	private String address;
	private String city;
	private String state;
	private String zip;
	private String productName;
	private String qty;
	private String units;
	private String price;
	private String discriptions;

	public Long getXlsId() {
		return xlsId;
	}

	public void setXlsId(Long xlsId) {
		this.xlsId = xlsId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	@Override
	public String toString() {
		return "ExcelUpload [xlsId=" + xlsId + ", customerName=" + customerName + ", phoneNum=" + phoneNum
				+ ", address=" + address + ", city=" + city + ", state=" + state + ", zip=" + zip + ", productName="
				+ productName + ", qty=" + qty + ", units=" + units + ", price=" + price + ", discriptions="
				+ discriptions + "]";
	}

	public ExcelUpload(Long xlsId, String customerName, String phoneNum, String address, String city, String state,
			String zip, String productName, String qty, String units, String price, String discriptions) {
		super();
		this.xlsId = xlsId;
		this.customerName = customerName;
		this.phoneNum = phoneNum;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.productName = productName;
		this.qty = qty;
		this.units = units;
		this.price = price;
		this.discriptions = discriptions;
	}

	public ExcelUpload() {
		super();
	}

}
