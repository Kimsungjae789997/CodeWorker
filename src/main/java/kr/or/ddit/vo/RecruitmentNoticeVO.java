package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecruitmentNoticeVO {
	
	private String recNtcId; // 공고ID
	private String crpId; // 기업ID
	private String deptCode; // 부서코드 -> 이건 이제 안쓸거라서 무조건 null임 데이터 넣지마세요
	private String recNtcTitle; // 공고명
	private String recNtcContent; // 공고내용
	private String recNtcRegDate; // 등록일
	private String recNtcStart;  // 모집시작일
	private String recNtcEnd; // 모집종료일
	private String eduCode; // 학력조건코드
	private String experienceCode; // 경력조건코드
	private String experienceLevelCode; // 경력연차
	private String workingTypeCode; // 고용형태
	private String workingLocCode; // 근무위치코드
	private String positionCode; // 모집포지션코드
	private String salaryRangeCode; // 연봉범위
	private String recNtcStatusCode; // 공고상태코드 -- 안쓰기로 함
	private String rcrtName; // 담당자이름
	private String rcrtTel; // 담당자연락처
	private String rcrtEmail; // 담당자이메일
	private String hit;
	private String delYn;
	
	// crpName 가져오기위한 도구 - innerJoin애서
	private String crpName;
	// d-day
	private int last;
	// 지역 넣어놀 곳
	private String location;

	// 파일 업로드
	private MultipartFile imgFile;
	
	// 공고등록할때 기술 스택 코드 담는곳 - 체크박스
	private List<String> skillstackList;
	
	// 자기소개서 문항 넣는곳
	private List<RecruitmentSelfIntroVO> selfIntroList;
	
	// 코딩테스트 문항 넣는곳
	private List<CodingTestVO> codingTestList;
	
	// 면접 장소 저장하는 곳
	private String memPostcode;
	private String memAddress1;
	private String memAddress2;
	// 면접 시간 저장하는 곳
	private String datetime;
	
	// 지원자수
	private int applicant;
	
	// 공고상태 - 공고대기중 , d-day , 공고마감
	private String status;
	
	private int rnum;
	
	// 채용공고 수 보기
	private int recNtcCount;
	
	// 기업의 info 저장
	private String crpInfoUrl;

	// 기업로고 저장
	private String crpLogoUrl;
	// 회사의 공고 이미지 저장
	private String crpRecntcInfo;
	
	private String crpAddress1;
	private String crpAddress2;
	
	private String skillstackCode;
	
	
}
