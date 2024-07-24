package org.spring.persistence;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.spring.domain.RegisterDTO;
import org.spring.domain.UserDTO;

@Mapper
public interface UserMapper {

	
	@Select("SELECT * FROM user WHERE user_email =#{user_email} OR social_user_email = #{user_email} AND user_name = #{user_name}")
	UserDTO getUser(UserDTO user);

//	 @Select("SELECT COUNT(*) FROM user WHERE user_email = #{user_email} AND user_pw = #{user_pw}")
	    public UserDTO validateUser(@Param("user_email") String user_email, @Param("user_pw") String user_pw);

	    public void registerUser(RegisterDTO user);

	    //naver
	    @Insert("INSERT INTO user (social_user_email, user_name, user_phone) VALUES (#{user_email}, #{user_name}, #{user_phone})")
	    void insertUser(UserDTO user);


	    //google
	    void insertOrUpdate(UserDTO userDTO);
	    // 아이디 중복 확인
	    public boolean checkId(@Param("user_email") String user_email);

	    // 이름 번호로 아이디 찾기
	    public String searchId(@Param("user_name") String user_name, @Param("user_phone") String user_phone);


}
