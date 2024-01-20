package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Contact;

public interface ContactRepository extends CrudRepository<Contact, String>{

}
