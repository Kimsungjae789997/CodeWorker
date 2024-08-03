package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CorporationVO {

   
    private String crpId;
    private String crpRegNo;
    private String crpName;
    private String crpRepresentative;
    private String crpLicenseNo;
    private MultipartFile crpFile;
    private String crpLicenseFile;
    private String crpUrl;
    private String crpZipCode;
    private String crpAddress1;
    private String crpAddress2;
    private String crpTel;
    private String crpEmail;
    private String crpOpeningDay;
    private String crpTypeCode;
    private String crpCapitalstock;
    private String crpIndustryCode;
    private String crpEmpNumber;
    private String crpInfo;
    private String crpLogoUrl;
    private String crpDelYN;
    private String crpInfoUrl;
    private String crpRecntcInfo;
    // ↓ resultMap 사용하려고
    private List<RecruitmentNoticeVO> recruitmentNoticeList;
    
    // corporationList 검색어 기능 구현할때 담을꺼임
    private List<CorporationVO> corporationList;
    
    private int recAll; // 관심회사 각각의 채용공고개수를 담는 곳
    
    private int proNo;
    private String proDate;
    private String proReplyStatusCode; 
    private String recNtcTitle;
    private String recNtcId;
}