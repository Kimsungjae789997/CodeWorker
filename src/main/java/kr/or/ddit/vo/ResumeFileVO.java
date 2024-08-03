package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeFileVO {
	private String memId;
	private MultipartFile file;
	
	private int fileNo;
	private String fileName;
	private long fileSize;
	private String fileSavepath;
	private int resumeNo;
	
	public ResumeFileVO() {}
	
	public ResumeFileVO(MultipartFile file) {
		this.file = file;
		this.fileName = file.getOriginalFilename();
		this.fileSize = file.getSize();
	}

}
