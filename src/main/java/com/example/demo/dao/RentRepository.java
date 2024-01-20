package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.RentCar;

public interface RentRepository extends CrudRepository<RentCar, Integer>{

}
