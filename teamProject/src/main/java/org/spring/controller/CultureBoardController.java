package org.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.domain.culture.Criteria;
import org.spring.domain.culture.CultureBoardDTO;
import org.spring.domain.culture.PageDTO;
import org.spring.service.CultureBoardService;
import org.spring.service.CultureBoardServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/culture/*")
public class CultureBoardController {
	
	@Autowired
    private CultureBoardService cultureboardService;
	
	@Autowired
	private CultureBoardServiceImpl cultureboardServiceImpl;

    @GetMapping("/list")
    public void listAll(@RequestParam(value="pageNum", defaultValue="1") int pageNum,
    					@RequestParam(value="amount", defaultValue="10") int amount,
    					@RequestParam(value="area", defaultValue="") String culture_area,
    					@RequestParam(value="classify", defaultValue="") String culture_classify,
    					Model model) {
    	System.out.println("listAll >> " + "pageNum: " + pageNum + ", amount: " + amount);
    	Criteria cri = new Criteria(pageNum, amount);
        int total = cultureboardService.getTotalCount(cri);
        
        System.out.println("total: "+total);
        List<CultureBoardDTO> list = cultureboardService.listPage(cri, culture_area, culture_classify);
        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("selectedArea", culture_area);
        model.addAttribute("selectedClassify", culture_classify);
    }
    
    @GetMapping("/get/{culture_bno}")
    public String get(@PathVariable("culture_bno") int culture_bno, Model model) {
    	CultureBoardDTO dto = cultureboardService.getBoard(culture_bno);
        model.addAttribute("dto", dto);
        
        String user_email = "test@example.com";
        model.addAttribute("user_email", user_email);
        boolean bookmarked = cultureboardServiceImpl.bookmarkChk(culture_bno, user_email);
        model.addAttribute("bookmarked", bookmarked);
        return "culture/get";
    }
    
    @PostMapping("/ajaxList")
    @ResponseBody
    public Map<String, Object> ajaxList(@RequestParam(value="pageNum") int pageNum,
                                        @RequestParam(value="amount") int amount,
                                        @RequestParam(value="area") String culture_area,
                                        @RequestParam(value="classify") String culture_classify) {
    	System.out.println("ajax >> " + "pageNum: " + pageNum + ", amount: " + amount);
        Criteria cri = new Criteria(pageNum, amount);
        cri.setArea(culture_area);
        cri.setClassify(culture_classify);
        
        int total = cultureboardService.getTotalCount(cri);
        System.out.println("total: "+total);
        List<CultureBoardDTO> list = cultureboardService.listPage(cri, culture_area, culture_classify);
        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        PageDTO pageDTO = new PageDTO(cri, total);
        result.put("pageMaker", pageDTO);
        return result;
    }
    
    @ResponseBody
    @PostMapping("/bookmark")
    public boolean policyBookmark(@RequestParam("user_email") String userEmail, @RequestParam("culture_bno") int culture_bno) throws Exception {
        boolean bookmark = cultureboardServiceImpl.bookmarkChk(culture_bno, userEmail);
        if (!bookmark) {
        	cultureboardServiceImpl.bookmark(culture_bno, userEmail);
        } else {
        	cultureboardServiceImpl.bookmarkDel(culture_bno, userEmail);
        }
        return !bookmark;
    }
}
