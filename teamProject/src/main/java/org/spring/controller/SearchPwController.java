package org.spring.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.spring.domain.UserDTO;
import org.spring.service.EmailService;
import org.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class SearchPwController {

    @Autowired
    private EmailService emailService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/YM/pw_find")
    public void pwFind() {
    	
    }
    
    @GetMapping("YM/pw_auth")
    public void pwAuth() {
    	
    }
    
    @GetMapping("YM/pw_new")
    public void pwNew() {
    	
    }
    
    @RequestMapping(value = "/YM/pw_auth.me", method = RequestMethod.POST)
    public String pwAuth(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");

        UserDTO userDTO =emailService.selectMember(email);
        System.out.println(userDTO);

        if (userDTO != null) {
            Random r = new Random();
            int num = r.nextInt(999999);  //랜덤난수설정

            if (userDTO.getUser_name().equals(name)) {
                session.setAttribute("email", userDTO.getUser_email());

                String title = "[동네26] 비밀번호변경 인증 이메일 입니다";
                String content = System.getProperty("line.separator") + "안녕하세요 회원님"
                        + System.getProperty("line.separator") + "동네26 비밀번호찾기(변경) 인증번호는 " + num + " 입니다."
                        + System.getProperty("line.separator"); 

                try {
                    emailService.sendEmail(email, title, content);
                } catch (Exception e) {
                    e.printStackTrace();
                    // Handle exception or set error message in the model
                }

                session.setAttribute("num", num);
                session.setAttribute("email", email);
                //추가
                session.setAttribute("login_type", "basic");
                return "YM/pw_auth";
            } else {
            	System.out.println("첫번째");
            	return "redirect:/YM/pw_find";
            }
        } else {
        	System.out.println("두번쨰");
            return "redirect:/YM/pw_find";
        }
    }
    
    //이메일 인증번호 확인
    @RequestMapping(value = "/YM/pw_set.me", method = RequestMethod.POST)
    public String pwSet(@RequestParam(value="emailCheck") String emailCheck,
    			@RequestParam(value = "num") String num) throws IOException{
    		
    		if(emailCheck.equals(num)) {
    			return "YM/pw_new";
    		}
    		else {
    			return "YM/pw_find";
    		}
    } 
    
   @RequestMapping(value = "/YM/pw_new.me", method = RequestMethod.POST)
	public String pwNew(@RequestParam("pw") String pw, @RequestParam("email") String email, HttpSession session) throws IOException{
	   System.out.println("pw : "+pw);
	   System.out.println("email : "+email);
	   
	   UserDTO userDTO = new UserDTO(pw, email);
		userDTO.setPw(pw);
		userDTO.setEmail(email);
		//추가
		userDTO.setLogin_type("basic");
		
		System.out.println("UserDTO: " + userDTO);
		
		int result = userService.updatePassword(userDTO);
		System.out.println("result in controller: "+result);
		
		if(result == 1) {
			return "redirect:/login";
		}
		else {
			System.out.println("pw_update"+ result);
			return "YM/pw_new";
		}
   }
}
