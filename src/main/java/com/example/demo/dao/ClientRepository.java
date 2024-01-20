package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Client;

public interface ClientRepository extends CrudRepository<Client, String> {

}
