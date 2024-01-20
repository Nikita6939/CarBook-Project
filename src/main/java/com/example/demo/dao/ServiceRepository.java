package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Service;

public interface ServiceRepository extends CrudRepository<Service, String> {

}
