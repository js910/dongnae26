package org.spring.persistence;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.spring.domain.culture.Criteria;
import org.spring.domain.culture.CultureBoardDTO;

public interface CultureBoardMapper {

    @Select("SELECT * FROM culture_board")
    public List<CultureBoardDTO> selectAll();

    @Select("SELECT * FROM culture_board WHERE culture_bno = #{culture_bno}")
    CultureBoardDTO selectBoard(int culture_bno);

    @Select({
        "<script>",
        "SELECT * FROM culture_board",
        "WHERE 1=1",
        "<if test='culture_area != null and !culture_area.isEmpty()'>",
        "AND culture_area = #{culture_area}",
        "</if>",
        "<if test='culture_classify != null and !culture_classify.isEmpty()'>",
        "AND culture_classify = #{culture_classify}",
        "</if>",
        "ORDER BY culture_bno DESC LIMIT #{cri.amount} OFFSET #{cri.offset}",
        "</script>"
    })
    public List<CultureBoardDTO> selectPage(@Param("cri") Criteria cri,
        @Param("culture_area") String culture_area, @Param("culture_classify") String culture_classify);

 // 북마크 추가
    public void bookmark(@Param("culture_bno") int culture_bno, @Param("user_email") String userEmail);

    // 북마크 삭제
    public void bookmarkDel(@Param("culture_bno") int culture_bno, @Param("user_email") String userEmail);

    // 북마크 여부 확인
    public int bookmarkChk(@Param("culture_bno") int culture_bno, @Param("user_email") String userEmail);

	public int getTotalCount(Criteria cri);
}
