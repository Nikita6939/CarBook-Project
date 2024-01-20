package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Cars;

public interface CarRepository extends CrudRepository<Cars, String>{

}
