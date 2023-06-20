package com.tonyspring.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;
import com.tonyspring.example.domain.User;


@Mapper
public interface UserMapper {
	//유저읽기
	   public User readUser(String username);
	   
	   //유저생성
	   public void createUser(User user);

	   // 권한 읽기
	   public List<GrantedAuthority> readAuthorities(String username);

	   // 권한 생성
	   public void createAuthority(User user);
	   
	   //유저리스트 가져오기
	   public List<User> selectUserList();
	   
		/* 회원 정보 수정 */
	   public void editUser(User user);
	   
		/* 회원 정보 삭제 */
	   public void deleteUser(User user);
}
