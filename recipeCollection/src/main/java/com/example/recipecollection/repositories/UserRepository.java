package com.example.recipecollection.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.recipecollection.models.User;

@Repository
public interface UserRepository extends CrudRepository < User, Long> {
	User findByEmail(String email);

}

