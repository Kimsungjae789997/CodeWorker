package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberAuth implements Serializable{

	private String memId;
	private String memAuth;
	
}
