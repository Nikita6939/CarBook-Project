package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Cart;

public interface CartRepository extends CrudRepository<Cart, String> {
   
	
}
