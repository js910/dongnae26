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

	@Override
	public boolean bookmarkChk(int culture_bno, int user_num) {
		return cultureboardMapper.bookmarkChk(culture_bno, user_num) > 0;
	}
	@Override
	public void bookmark(int culture_bno, int user_num, String culture_classify, String culture_title) {
		cultureboardMapper.bookmark(culture_bno, user_num, culture_classify, culture_title);
	}
	@Override
	public void bookmarkDel(int culture_bno, int user_num, String culture_classify, String culture_title) {
		cultureboardMapper.bookmarkDel(culture_bno, user_num, culture_classify, culture_title);
	}

	@Override
	public List<CultureBoardDTO> listAll(Criteria cri, String culture_area, String culture_classify) {
		System.out.println("service listAll ~~~" + cultureboardMapper.selectAll(cri, culture_area, culture_classify));
		return cultureboardMapper.selectAll(cri, culture_area, culture_classify);
	}




}