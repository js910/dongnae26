package org.spring.domain.community;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommunityCommentDTO {

	private Integer community_cno;
	private String community_com_content;
	private Timestamp community_com_regdate;
	private Integer user_num;
	private Integer community_bno;
	private String comment_writer;
}
