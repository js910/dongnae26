package org.spring.domain;

import lombok.Data;

@Data
public class UserDTO {
	private int user_num;
	private String user_email;
	private String social_user_email;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_interest;
	
	private String id;
    private String email;
    private String verified_email;
    private String name;
    private String given_name;
    private String family_name;
    private String picture;
    
public UserDTO() {}
    
    public UserDTO(String user_email, String user_pw, String user_name, String user_phone, String user_interest) {
        this.user_email = user_email;
        this.user_pw = user_pw;
        this.user_name = user_name;
        this.user_phone = user_phone;
        this.user_interest = user_interest;
    }

    public UserDTO(String user_email, String user_pw, String user_name) {
        this.user_email = user_email;
        this.user_pw = user_pw;
        this.user_name = user_name;
    }
}
