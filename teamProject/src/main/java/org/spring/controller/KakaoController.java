package org.spring.controller;

import javax.servlet.http.HttpSession;

import org.spring.domain.UserDTO;
import org.spring.model.KakaoAuthResponse;
import org.spring.model.KakaoTokenResponse;
import org.spring.model.KakaoUserInfoResponse;
import org.spring.service.KakaoService;
import org.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/kakao/*")
public class KakaoController {
    @Autowired
    private KakaoService kakaoService;

    @GetMapping("/oauth")
    public String oauthResult(@RequestParam("code") String code, HttpSession session, Model model) {
        KakaoAuthResponse response = new KakaoAuthResponse();
        response.setCode(code);

        KakaoTokenResponse token = kakaoService.getToken(response);

        if (token != null && token.getAccess_token() != null) {
            // 사용자 정보 요청
            KakaoUserInfoResponse userInfo = kakaoService.getUserInfo(token.getAccess_token());
            model.addAttribute("userInfo", userInfo);
            
            // 세션에 로그인 사용자 정보 저장
            session.setAttribute("loginUserID", userInfo.getKakao_account().getEmail());
            session.setAttribute("loginType", "kakao");
            session.setAttribute("kakaoUserInfo", userInfo);
            session.setAttribute("user_name", userInfo.getKakao_account().getName());
            session.setAttribute("user_email", userInfo.getKakao_account().getEmail());
            session.setAttribute("user_phone", userInfo.getKakao_account().getPhone_number());
            model.addAttribute("isLogin", true);
        } else {
            model.addAttribute("isLogin", false);
        }

        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("isLogin", false);
        return "redirect:/login";
    }
}
