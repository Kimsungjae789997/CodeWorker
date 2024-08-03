package kr.or.ddit.controller.seeker.cote;

import java.io.File;
import java.lang.reflect.Method;
import java.nio.file.Files;

public class FileClassLoader extends ClassLoader {
    
    public String process(String clsName, String clsString, int input) {
        String folder = System.getProperty("user.dir") + "\\dynamic";
        
        JavaCompile jc = new JavaCompile();
        // 자바 파일 생성 및 클래스 생성
        String result = jc.compile(clsName, clsString);
        File file = new File(folder, clsName + ".class");
        byte[] classByte;
        
        try {
            classByte = Files.readAllBytes(file.toPath());
            Class<?> dynamic = findClass(classByte, "dynamic." + clsName);
            file.delete();
            
            Method solution = dynamic.getMethod("solution", int.class);
            solution.setAccessible(true);  // 접근 제한자를 무시하도록 설정
            
           // input = 10; // 예제 인자로 10을 전달
            
            Object resultObj = solution.invoke(null, input); // static 메소드이므로 인스턴스가 필요없음
            
            result = "" + resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            result = e.getMessage();
        }
        return result;
    }

    public Class<?> findClass(byte[] classByte, String name) throws ClassNotFoundException {
        return defineClass(name, classByte, 0, classByte.length);
    }
}