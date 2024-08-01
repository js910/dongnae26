package org.spring.domain.policy;

import lombok.Data;

@Data
public class PolicyBookmarkDTO {

	private String serviceID; 
    private int user_num;
    private String serviceName;
    private String serviceContent;
    private String serviceDeadline; 
}