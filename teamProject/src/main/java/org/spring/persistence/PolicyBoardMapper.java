package org.spring.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring.domain.BookmarkDTO;
import org.spring.domain.policy.Criteria;

public interface PolicyBoardMapper {

	// 전체 게시글 수 반환
	public int getTotalCount(Criteria cri);
		
	// 북마크 추가 메서드
    void bookmark(@Param("serviceID") String serviceID, @Param("user_num") int user_num, @Param("cmpnyNm") String cmpnyNm, @Param("bsnsSumryCn") String bsnsSumryCn);

    // 북마크 삭제 메서드
    void bookmarkDel(@Param("serviceID") String serviceID, @Param("user_num") int user_num);

    // 북마크 여부 확인 메서드
    int bookmarkChk(@Param("serviceID") String serviceID, @Param("user_num") int user_num);

    // 사용자 북마크 조회 메서드
    List<BookmarkDTO> getUserBookmarks(@Param("user_num") int user_num);
		
		
	
}
