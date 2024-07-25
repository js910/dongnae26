package org.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.spring.domain.community.CommunityBoardDTO;
import org.spring.domain.community.CommunityCommentDTO;
import org.spring.domain.community.Criteria;
import org.spring.domain.community.PageDTO;
import org.spring.domain.UserDTO; 
import org.spring.domain.community.ViewCountDTO;
import org.spring.service.CommunityBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/community/*")
public class CommunityBoardController {

    @Autowired
    private CommunityBoardService service;
    private final String uploadPath = "C:/Users/wlghk/git/Team_E1I4/teamProject/src/main/webapp/resources/images/";

    @GetMapping("/register")
    public String registerForm(CommunityBoardDTO board, HttpSession session) {
        String login = (String) session.getAttribute("loginUserID");
        if (login == null || login.isEmpty()) {
            return "redirect:/login";
        }
        return "/community/register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute CommunityBoardDTO board, 
                           @RequestParam(value = "file", required = false) MultipartFile file, 
                           HttpSession session) throws IOException {
        
        UserDTO user = (UserDTO) session.getAttribute("user_info");
        if (user == null) {
            return "redirect:/login";
        }

        board.setUser_num(user.getUser_num());
        board.setWriter(user.getUser_name());

        try {
            // 게시글 등록
            service.register(board);

            // 파일 업로드 처리
            if (file != null && !file.isEmpty()) {
                String uploadDir = uploadPath + board.getCommunity_bno();
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                File uploadFilePath = new File(uploadDir + "/" + fileName);
                file.transferTo(uploadFilePath);
                board.setCommunity_filename(fileName);
                service.updateFileName(board);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 및 사용자에게 친절한 메시지 제공
        }

        return "redirect:/community/list";
    
    }
    
    @GetMapping("/list")
    public String list(Criteria cri, Model model, HttpSession session) {
        List<CommunityBoardDTO> list = service.getListWithPaging(cri);
        model.addAttribute("boardlist", list);
        
        UserDTO user = (UserDTO) session.getAttribute("user_info");
        System.out.println(user);
        System.out.println(list);

        int total = service.getTotal(cri);
        PageDTO pageResult = new PageDTO(cri, total);
        System.out.println(total);
        model.addAttribute("pageMaker", pageResult);

        return "community/list"; // JSP 파일 경로
    }
    
    @ResponseBody
    @PostMapping("/getList")
    public Map<String, Object> getList(Criteria cri) {
        System.out.println("Ajax로 전체 게시물 조회>>>");

        List<CommunityBoardDTO> list = service.getListWithPaging(cri);
        int total = service.getTotal(cri);
        PageDTO pageResult = new PageDTO(cri, total);

        Map<String, Object> response = new HashMap<>();
        response.put("boardlist", list);
        response.put("pageMaker", pageResult);

        System.out.println(list);
        System.out.println(pageResult);

        return response;
    }
    
    
    @GetMapping("/get")
    public String getList(@RequestParam("community_bno") Integer community_bno, Model model, HttpSession session,
            HttpServletRequest request, HttpServletResponse response) {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        String name = user != null ? user.getUser_name() : null;
        Integer userId = user != null ? user.getUser_num() : null;
        System.out.println("get: "+ name);
        System.out.println("get: "+ userId);
        if (userId != null) {
            ViewCountDTO viewCnt = new ViewCountDTO();
            viewCnt.setView_user_num(userId);
            viewCnt.setCommunity_bno(community_bno);
            if (!service.checkViewCnt(viewCnt)) {
                service.updateViewCnt(community_bno);
                service.insertViewCnt(viewCnt);
            }
        } else {
            boolean isViewed = false;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("viewed_" + community_bno)) {
                        isViewed = true;
                        break;
                    }
                }
            }
            if (!isViewed) {
                service.updateViewCnt(community_bno);
                Cookie newCookie = new Cookie("viewed_" + community_bno, "true");
                newCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(newCookie);
            }
        }

        CommunityBoardDTO board = service.get(community_bno);
        board = service.getBoardById(community_bno);
        model.addAttribute("board", board);
        int connunutyBno = board.getCommunity_bno();
        List<CommunityCommentDTO> comments = service.getCommentsByBoardId(connunutyBno);
        model.addAttribute("comments", comments);
        return "/community/get";
    }

    @GetMapping("/modify")
    public String modifyForm(@RequestParam("community_bno") Integer community_bno, Model model, HttpSession session) {
        CommunityBoardDTO board = service.get(community_bno);
        UserDTO user = (UserDTO) session.getAttribute("user_info");

        if (user == null || user.getUser_name() == null || user.getUser_name().isEmpty()) {
            session.invalidate();
            return "redirect:/login";
        } else if (!board.getUser_num().equals(user.getUser_num())) {
            return "redirect:/community/list";
        } else {
            model.addAttribute("board", board);
            return "/community/modify";
        }
    }

    @PostMapping("/modify")
    public String modify(CommunityBoardDTO board, HttpSession session,@RequestParam("existing_filename") String existingFilename,
    		@RequestParam("file") MultipartFile file)
            throws IOException {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        board.setUser_num(user.getUser_num());
        board.setWriter(user.getUser_name());

        if (!file.isEmpty()) {
            String uploadDir = uploadPath + board.getCommunity_bno();
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File uploadFilePath = new File(uploadDir + "/" + fileName);
            file.transferTo(uploadFilePath);
            board.setCommunity_filename(fileName);
            service.updateFileName(board);
        }else {
        	board.setCommunity_filename(existingFilename);
        }
        service.modify(board);
        return "redirect:/community/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("community_bno") Integer community_bno, HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        CommunityBoardDTO board = service.get(community_bno);
        System.out.println("remove:+++++++++++++++++++++"+board.getCommunity_bno());
        System.out.println("remove:+++++++++++++++++++++"+board.getUser_num());
        if (user == null || user.getUser_name().isEmpty()) {
        	System.out.println("remove:비로그인");
            session.invalidate();
            return "redirect:/login";
        } else if (!board.getUser_num().equals(user.getUser_num())) {
        	System.out.println(board.getUser_num());
        	System.out.println(user.getUser_num());
        	System.out.println("remove: 유저번호 불일치");
            return "redirect:/community/list";
        } else 
            service.remove(community_bno);

        return "redirect:/community/list";
    }

    @PostMapping("/registerComment")
    @ResponseBody
    public ResponseEntity<List<CommunityCommentDTO>> registerComment(@RequestBody CommunityCommentDTO comment, HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        comment.setComment_writer(user.getUser_name());
        service.registerComment(comment);
        List<CommunityCommentDTO> comments = service.getCommentsByBoardId(comment.getCommunity_bno());
        return ResponseEntity.ok(comments);
    }

    @PostMapping("/modifyComment")
    @ResponseBody
    public ResponseEntity<List<CommunityCommentDTO>> modifyComment(@RequestBody CommunityCommentDTO comment, HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        comment.setComment_writer(user.getUser_name());
        service.modifyComment(comment);
        List<CommunityCommentDTO> comments = service.getCommentsByBoardId(comment.getCommunity_bno());
        return ResponseEntity.ok(comments);
    }

    @GetMapping("/removeComment")
    @ResponseBody
    public ResponseEntity<List<CommunityCommentDTO>> removeComment(@RequestParam("community_cno") Integer community_cno,
            HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("user_info");
        if (user == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }

        CommunityCommentDTO comment = service.getCommentById(community_cno);
        if (comment == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        if (comment.getUser_num() == null || !comment.getUser_num().equals(user.getUser_num())) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
        }

        service.removeComment(community_cno);
        List<CommunityCommentDTO> comments = service.getCommentsByBoardId(comment.getCommunity_bno());
        return ResponseEntity.ok(comments);
    }

    @PostMapping("/getCommentsByBoardId")
    @ResponseBody
    public ResponseEntity<List<CommunityCommentDTO>> getCommentsByBoardId(@RequestBody CommunityBoardDTO board) {
        List<CommunityCommentDTO> comments = service.getCommentsByBoardId(board.getCommunity_bno());
        System.out.println(comments);
        return ResponseEntity.ok(comments);
    }

}