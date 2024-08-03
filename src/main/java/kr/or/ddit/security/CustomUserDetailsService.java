package kr.or.ddit.security;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.ILoginMapper;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private ILoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("# loadUserByUsername() 실행...!");
		log.info("# loadUserByUsername() : " + username);
		
		MemberVO memberVO;
		
		String auth = loginMapper.selectUserRole(username);
		
		Map<String, String> userParam = new HashMap<String, String>();
		userParam.put("username", username);
		userParam.put("auth", auth);
		
		try {
			memberVO = loginMapper.readByUserId(userParam);
			log.info("query by member mapper : " + memberVO);
			return memberVO == null ? null : new CustomUser(memberVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

















