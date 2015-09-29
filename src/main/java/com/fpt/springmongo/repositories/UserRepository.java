package com.fpt.springmongo.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.fpt.springmongo.model.User;

@Repository
public interface UserRepository extends MongoRepository<User, String> {

}
