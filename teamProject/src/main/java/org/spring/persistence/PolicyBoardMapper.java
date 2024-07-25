package org.spring.persistence;

import org.apache.ibatis.annotations.Param;
import org.spring.domain.policy.Criteria;

public interface PolicyBoardMapper {

	// 전체 게시글 수 반환
	public int getTotalCount(Criteria cri);
		
	// 북마크 추가
    public void bookmark(@Param("serviceID") String serviceID, @Param("user_num") int user_num);

    // 북마크 삭제
    public void bookmarkDel(@Param("serviceID") String serviceID, @Param("user_num") int user_num);

    // 북마크 여부 확인
    public int bookmarkChk(@Param("serviceID") String serviceID, @Param("user_num") int user_num);
}
