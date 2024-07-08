package com.masai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.masai.model.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer>{
	public User findByUserName(String username);
	public User findByUserLoginId(Integer userLoginId);

//	@Query("SELECT u FROM User u WHERE u.userLoginId = :loginId")
//	public User findByLoginId(@Param("userLoginId") Integer loginId);

}
