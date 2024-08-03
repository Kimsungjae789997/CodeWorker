package kr.or.ddit.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class adminImageUploadController {

    @RequestMapping(value = "/imageUpload")
    public String imageUpload(
            MultipartHttpServletRequest multiFile,
            HttpServletRequest req,
            HttpServletResponse resp) throws Exception {
        
        JsonObject json = new JsonObject();
        PrintWriter printWriter = null;
        OutputStream out = null;
        long limitSize = 1024 * 1024 * 2;
        
        MultipartFile file = multiFile.getFile("upload");
        
        if(file != null && file.getSize() > 0 && StringUtils.isNotBlank(file.getOriginalFilename())) {
            if(file.getContentType().toLowerCase().startsWith("image/")) {
                if(file.getSize() > limitSize) {
                    JsonObject jsonMsg = new JsonObject();
                    JsonArray jsonArr = new JsonArray();
                    jsonMsg.addProperty("message", "2MB미만 이미지만 업로드 가능합니다");
                    jsonArr.add(jsonMsg);
                    json.addProperty("uploaded", 0);
                    json.add("error", jsonArr.get(0));
                    
                    resp.setCharacterEncoding("utf-8");
                    printWriter = resp.getWriter();
                    printWriter.println(json);
                } else {
                    try {
                        String fileName = file.getOriginalFilename();
                        byte[] bytes = file.getBytes();
                        
                        // 이미지 저장 경로 설정
                        String uploadPath = req.getServletContext().getRealPath("/resources/assets/images");
                        File uploadFile = new File(uploadPath);
                        if(!uploadFile.exists()) {
                            uploadFile.mkdirs();
                        }
                        
                        fileName = UUID.randomUUID().toString() + "_" + fileName;
                        uploadPath = uploadPath + "/" + fileName;
                        out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        String fileUrl = req.getContextPath() + "/resources/assets/images/" + fileName;
                        
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    } catch (IOException e) {
                        e.printStackTrace();
                    } finally {
                        if(out != null) {
                            out.close();
                        }
                        if(printWriter != null) {
                            printWriter.close();
                        }
                    }
                }
            }
        }
        return null;
    }
}