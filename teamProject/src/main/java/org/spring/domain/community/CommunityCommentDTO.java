package org.spring.domain.community;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class CommunityCommentDTO {

	private Integer community_cno;
	private String community_com_content;
	private Timestamp community_com_regdate;
	private Integer user_num;
	private Integer community_bno;
	private String comment_writer;
	
	public CommunityCommentDTO(){}
	
	 public String getCommunity_com_content() {
	        return community_com_content;
	    }

	    public void setCommunity_com_content(String community_com_content) {
	        this.community_com_content = community_com_content;
	    }

	    public Timestamp getCommunity_com_regdate() {
	        return community_com_regdate;
	    }

	    public void setCommunity_com_regdate(Timestamp community_com_regdate) {
	        this.community_com_regdate = community_com_regdate;
	    }

		public CommunityCommentDTO(String community_com_content, Integer user_num, String comment_writer) {
			super();
			this.community_com_content = community_com_content;
			this.user_num = user_num;
			this.comment_writer = comment_writer;
		}
}
