package com.pm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;

import com.pm.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	// Customized query to return list of users
    @Query("SELECT u FROM User u")
    List<User> findAllUsers();
    
    //for user login 
    @Query("SELECT u FROM User u WHERE u.emailadd = :emailadd AND u.password = :password")
    public User findUserEmailAndPsw(@Param("emailadd") String emailadd, @Param("password") String password);
    
}
