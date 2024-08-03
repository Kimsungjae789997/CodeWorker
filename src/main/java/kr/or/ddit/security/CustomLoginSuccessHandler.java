package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
    
    private RequestCache requestCache = new HttpSessionRequestCache();
    
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        log.info("-------------로그인 처리 성공-------------");
        User customUser = (User) authentication.getPrincipal();
        request.getSession().setAttribute("user", customUser);
        log.info("세션에 저장된 사용자 정보: {}", customUser);
        
        // 권한 확인
        log.info("사용자 권한: {}", customUser.getAuthorities());
        
        // 인증이 완료된 사용자 ID 꺼내기
        log.info("유저네임 : " + customUser.getUsername());
        // 인증이 완료된 사용자 pw 꺼내기
        log.info("비번 : " + customUser.getPassword());
        
        // 세션에 등록되어있는 인증 과정에서 발생한 에러 정보를 삭제
        clearAuthenticationAttribute(request);
        
        //  ############  여기서 기업회원, 일반회원, 관리자가 로그인 할때 타겟 URL을 바꿔야 한다. db랑 연결? 지어서 구분 지어보기 <- 관리자,기업회원 메인페이지 만들면 만든다.
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        String targetUrl = "";
        
        if (savedRequest != null) {
            targetUrl = savedRequest.getRedirectUrl();
        } else {
            targetUrl = determineTargetUrl(authentication);
        }
        
        log.info("타겟 URL Login Success targetUrl : " + targetUrl);
        response.sendRedirect(targetUrl);
    }

    private void clearAuthenticationAttribute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
        if (session == null) {
            return;
        }
        
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
    
    private String determineTargetUrl(Authentication authentication) {
        boolean isUser = false;
        boolean isAdmin = false;
        boolean isCompany = false;
        
        for (GrantedAuthority authority : authentication.getAuthorities()) {
            if (authority.getAuthority().equals("ROLE_SEEKER")) {
                isUser = true;
                break;
            } else if (authority.getAuthority().equals("ROLE_ADMIN")) {
                isAdmin = true;
                break;
            } else if (authority.getAuthority().equals("ROLE_RECRUITER")) {
                isCompany = true;
                break;
            }
        }
        
        if (isAdmin) {
            return "/admin/main";
        } else if (isCompany) {
            return "/recruiter/main";
        } else if (isUser) {
            return "/main/list.do";
        } else {
            throw new IllegalStateException();
        }
    }
}