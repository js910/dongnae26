package org.spring.service;

import java.util.List;
import java.util.Map;

import org.spring.domain.culture.Criteria;
import org.spring.domain.culture.CultureBoardDTO;
import org.spring.persistence.CultureBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CultureBoardServiceImpl implements CultureBoardService {

	@Autowired
	private CultureBoardMapper cultureboardMapper;

	@Override
    public CultureBoardDTO getBoard(int culture_bno) {
        return cultureboardMapper.selectBoard(culture_bno); // 추가된 메서드
    }

	@Override
	public List<CultureBoardDTO> listPage(Criteria cri, String culture_area, String culture_classify) {
		return cultureboardMapper.selectPage(cri, culture_area, culture_classify);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return cultureboardMapper.getTotalCount(cri);
	}

	
	// 북마크 추가 메서드
	public void bookmark(int culture_bno, String user_email) {
		cultureboardMapper.bookmark(culture_bno, user_email);
	}
	
	// 북마크 삭제 메서드
	public void bookmarkDel(int culture_bno, String user_email) {
		cultureboardMapper.bookmarkDel(culture_bno, user_email);
	}
	
	// 북마크 여부 확인 메서드
	public boolean bookmarkChk(int culture_bno, String user_email) {
	    return cultureboardMapper.bookmarkChk(culture_bno, user_email) > 0;
	}

	@Override
	public List<CultureBoardDTO> listAll(Criteria cri, String culture_area, String culture_classify) {
		System.out.println("service listAll ~~~" + cultureboardMapper.selectAll(cri, culture_area, culture_classify));
		return cultureboardMapper.selectAll(cri, culture_area, culture_classify);
	}




}
 