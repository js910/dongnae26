package org.spring.service;

import java.util.List;
import java.util.Map;

import org.spring.domain.culture.Criteria;
import org.spring.domain.culture.CultureBoardDTO;
import org.spring.persistence.CultureBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public interface CultureBoardService {

		// 게시판 페이지
		public List<CultureBoardDTO> listAll();
		
		// 상세보기 페이지
		CultureBoardDTO getBoard(int culture_bno);

		
		// 페이징 처리를 위한 게시글 목록
		public List<CultureBoardDTO> listPage(Criteria cri, String culture_area, String culture_classify);
		
		// 전체 게시글 수
		public int getTotalCount(Criteria cri);


}
