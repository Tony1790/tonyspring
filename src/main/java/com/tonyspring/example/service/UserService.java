package com.tonyspring.example.service;

import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import com.tonyspring.example.domain.User;


public interface UserService extends UserDetailsService {
	//유저읽기
	   public User readUser(String username);
	      
	   //유저생성
	   public void createUser(User user);

	   // 권한 생성
	   public void createAuthorities(User user);
	   
	   // 시큐리티 권한 얻기
	   Collection<GrantedAuthority> getAuthorities(String username);
	   
	   //유저리스트 가져오기
	   public List<User> selectUserList();
	   
	   //유저 정보 수정
	   public void editUser(User user);
	   
	   //유저 삭제
	   public void deleteUser(User user);
	   
	   public int countUsers();
	   
}
