package org.spring.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.spring.domain.job.JobBoardDTO;
import org.spring.domain.job.JobCriteria;
import org.spring.model.JobBoardResponse.Row;


@Mapper
public interface JobBoardMapper {

	boolean existsByJoRegistNo(String joRegistNo);
	
    @Insert("INSERT INTO job_board (joRegistNo, cmpnyNm, bsnsSumryCn, mngrInsttNm, dtyCn, jobcodeNm, " +
            "rcritNmprCo, acdmcrNm, careerCndNm, hopeWage, workTimeNm, holidayNm, workPararBassAdresCn, " +
            "joSj, joRegDt, receptClosNm, receptMthNm, presentnPapersNm, mngrNm, mngrPhonNo) " +
            "VALUES (#{joRegistNo}, #{cmpnyNm}, #{bsnsSumryCn}, #{mngrInsttNm}, #{dtyCn}, #{jobcodeNm}, " +
            "#{rcritNmprCo}, #{acdmcrNm}, #{careerCndNm}, #{hopeWage}, #{workTimeNm}, #{holidayNm}, " +
            "#{workPararBassAdresCn}, #{joSj}, #{joRegDt}, #{receptClosNm}, #{receptMthNm}, " +
            "#{presentnPapersNm}, #{mngrNm}, #{mngrPhonNo})")
    public void insertJobBoardData(JobBoardDTO jobBoardDTO);
    
    @Select("SELECT * FROM job_board")
    public List<JobBoardDTO> getAllJobBoardData(JobCriteria cri);

	public int getTotalCount(JobCriteria cri);

	public List<JobBoardDTO> getListWithSearch(JobCriteria cri);

	@Select("SELECT * FROM job_board WHERE joRegistNo = #{jobId}")
	public JobBoardDTO getJobDetail(String jobId);
	
}
