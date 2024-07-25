package org.spring.controller;

import org.spring.domain.job.JobBoardDTO;
import org.spring.domain.job.JobCriteria;
import org.spring.domain.job.JobPageDTO;
import org.spring.service.JobBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/job/*")
public class JobBoardController {

    @Autowired
    private JobBoardService jobBoardService;

    @GetMapping("/fetchAndSaveAll") // 데이터 업데이트
    public String fetchAndSaveAllJobBoardData() {
        jobBoardService.fetchAndSaveAllJobBoardData();
        return "/job/upload_success"; 
    }

    @GetMapping("/list")
    public String getJobBoardData(JobCriteria cri, Model model) {
    	System.out.println("cri 값 : " + cri);
    	int total = jobBoardService.getTotal(cri);
    	
    	JobPageDTO pageResult = new JobPageDTO(cri, total);
		model.addAttribute("pageMaker", pageResult);
		
		System.out.println("total : " + total);
		System.out.println("pageResult : " + pageResult);
		
    	List<JobBoardDTO> jobBoardData = jobBoardService.getJobBoardData(cri);
        model.addAttribute("jobBoardData", jobBoardData);
        model.addAttribute("cri", cri);
        return "/job/list";
    }
    
    @ResponseBody
    @PostMapping("/getList")
    public List<JobBoardDTO> getList(JobCriteria cri, Model model){
    	System.out.println("Ajax로 전체 게시물 조회>>>");
    	int total = jobBoardService.getTotal(cri);
    	
    	JobPageDTO pageResult = new JobPageDTO(cri,total);
    	model.addAttribute("pageMaker",pageResult);
    	return jobBoardService.getList(cri);
    }
    
    @GetMapping("/detail")
    public String getJobDetail(@RequestParam("jobId") String jobId, JobCriteria cri, Model model) {
        JobBoardDTO jobDetail = jobBoardService.getJobDetail(jobId);
        model.addAttribute("jobDetail", jobDetail);
        model.addAttribute("cri", cri);
        return "/job/detail";
    }
    
    @PostMapping("/bookmark")
    @ResponseBody
    public String bookmarkJob(@RequestParam("joRegistNo") String joRegistNo, @RequestParam("cmpnyNm") String cmpnyNm, 
    						  @RequestParam("user_num") int user_num, @RequestParam("bsnsSumryCn") String bsnsSumryCn) {
        jobBoardService.bookmarkJob(joRegistNo, user_num, cmpnyNm, bsnsSumryCn);
        return "success";
    }
}
