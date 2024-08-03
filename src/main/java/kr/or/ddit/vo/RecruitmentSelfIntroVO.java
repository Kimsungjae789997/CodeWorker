package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RecruitmentSelfIntroVO {

	private int selfIntroNo; // 문항번호
	private String recNtcId; // 공고id
	private String selfIntroTitle; // 자기소개제목
	private String selfIntroContent; //자기소개내용
}
