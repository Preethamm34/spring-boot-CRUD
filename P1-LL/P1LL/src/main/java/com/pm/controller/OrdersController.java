package com.pm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pm.model.Customer;
import com.pm.model.Product;
import com.pm.repository.CustomerRepository;
import com.pm.repository.ProductRepository;
import com.pm.service.CustomerService;
import com.pm.service.ProductService;

import jakarta.validation.Valid;

@Controller
@RequestMapping(value = { "/orders" })
public class OrdersController {

	@Autowired
	private ProductRepository productRepo;

	@Autowired
	private CustomerRepository customerRepo;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	public OrdersController(ProductRepository productRepo, CustomerRepository customerRepo,
			ProductService productService, CustomerService customerService) {
		super();
		this.productRepo = productRepo;
		this.customerRepo = customerRepo;
		this.customerService = customerService;
		this.productService = productService;
	}

	@RequestMapping(value = "/orderPge")
	public String orderPage() {
		return "addorderPage";
	}

	// showing all order list
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(Model model) {
		try {
			List<Customer> customers = customerRepo.findAllCustomersWithProducts();
			model.addAttribute("customers", customers);
			model.addAttribute("allCustomers", customers);
		//	model.addAttribute("allProduct", customers);
		} catch (Exception e) {
			model.addAttribute("error", "Error fetching orders: " + e.getMessage());
			e.printStackTrace();
		}
		return "orderList";
	}

	@RequestMapping(value = "/searchorderList", method = RequestMethod.POST)
	public String searchorderList(@RequestParam(name = "costomerId",required = false) Integer  costomerId,
	                              @RequestParam(name = "productId",required = false) Integer  productId, Model model) {
	    try {
	    	    List<Customer> customers = customerRepo.searchAllCustomersWithProducts(costomerId, productId);
	    	    model.addAttribute("customers", customers);
	    } catch (Exception e) {
	        model.addAttribute("error", "Error fetching orders: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return "redirect:/orders/orderList";
	}

	// save order details
	@Transactional
	@RequestMapping(value = "/saveOrders", method = RequestMethod.POST)
	public String saveOrderDetails(@Valid @ModelAttribute Customer customer, RedirectAttributes redirectAttributes) {
		try {
			if (customer.getCostomerId() < 1) {
				for (Product product : customer.getProducts()) {
					product.setCustomer(customer);
				}
				customerRepo.save(customer); // jpa method
				redirectAttributes.addFlashAttribute("message", "order saved successfully.");
			} else {
				redirectAttributes.addFlashAttribute("error", "Failed to save Order details.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to save Order details.");
		}
		return "redirect:/orders/orderList";
	}
}
