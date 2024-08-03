package kr.or.ddit.controller.seeker;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.seeker.cote.FileClassLoader;
import kr.or.ddit.service.IMypageService;
import kr.or.ddit.vo.AnswerCodingTestVO;
import kr.or.ddit.vo.ApplyVO;
import kr.or.ddit.vo.CodingTestVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitmentCodingTestVO;
import kr.or.ddit.vo.RecruitmentNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/apply")
public class MypageApplyController {

   @Inject
   private IMypageService mypageService;
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/main.do", method = RequestMethod.GET)
   public String mypageApplyMain(
         Model model,
         @RequestParam(value = "tab", required = false) String tab // 탭 정보 추가
         ) {

      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         // 지원완료 총 수
         int cnt1 = mypageService.getCount1(memberVO.getMemId());
         // 서류통과 총 수
         int cnt2 = mypageService.getCount2(memberVO.getMemId());
         // 코딩테스트 총 수
         int cnt3 = mypageService.getCount3(memberVO.getMemId());
         // 최종합격 수
         int cnt4 = mypageService.getCount4(memberVO.getMemId());
         // 불합격 수
         int cnt5 = mypageService.getCount5(memberVO.getMemId());
         
         model.addAttribute("cnt1", cnt1);
         model.addAttribute("cnt2", cnt2);
         model.addAttribute("cnt3", cnt3);
         model.addAttribute("cnt4", cnt4);
         model.addAttribute("cnt5", cnt5);
         model.addAttribute("memId", memberVO.getMemId());
         
         log.info("cnt1 : " + cnt1);
         log.info("cnt2 : " + cnt2);
         log.info("cnt3 : " + cnt3);
         log.info("cnt4 : " + cnt4);
         log.info("cnt5 : " + cnt5);
      }
      
      model.addAttribute("selectedTab", tab); // 선택된 탭 정보 추가
      log.info("tab" + tab);
      return "seeker/mypageApplyMain";
   }
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/applySuccessSelect", method = RequestMethod.GET)
   public ResponseEntity<List<ApplyVO>> applySuccess(){
      log.info("applySuccess() 실행=-================");
      
      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         
         //  마이페이지에서 지원현황 지원완료애들 정보가져오기 
         List<ApplyVO> applyList = mypageService.applySuccess(memberVO.getMemId());
         return new ResponseEntity<List<ApplyVO>>(applyList,HttpStatus.OK);
      }
      
      return null;
   }
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/documentSuccessSelect", method = RequestMethod.GET)
   public ResponseEntity<List<ApplyVO>> documentSuccess(){
      log.info("documentSuccess() 실행=-================");
      
      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         
         //  마이페이지에서 지원현황 지원완료애들 정보가져오기 
         List<ApplyVO> applyList = mypageService.documentSuccess(memberVO.getMemId());
         return new ResponseEntity<List<ApplyVO>>(applyList,HttpStatus.OK);
      }
      
      return null;
   }
   
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/coteSuccessSelect", method = RequestMethod.GET)
   public ResponseEntity<List<ApplyVO>> coteSuccess(){
      log.info("coteSuccess() 실행=-================");
      
      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         
         //  마이페이지에서 지원현황 지원완료애들 정보가져오기 
         List<ApplyVO> applyList = mypageService.coteSuccess(memberVO.getMemId());
         return new ResponseEntity<List<ApplyVO>>(applyList,HttpStatus.OK);
      }
      
      return null;
   }
   
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/finalApplySuccessSelect", method = RequestMethod.GET)
   public ResponseEntity<List<ApplyVO>> finalApplySuccess(){
      log.info("finalApplySuccess() 실행=-================");
      
      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         
         //  마이페이지에서 지원현황 지원완료애들 정보가져오기 
         List<ApplyVO> applyList = mypageService.finalApplySuccess(memberVO.getMemId());
         return new ResponseEntity<List<ApplyVO>>(applyList,HttpStatus.OK);
      }
      
      return null;
   }
   
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/failApplySuccessSelect", method = RequestMethod.GET)
   public ResponseEntity<List<ApplyVO>> failApplySuccess(){
      log.info("failApplySuccess() 실행=-================");
      
      CustomUser user = 
            (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      MemberVO memberVO = user.getMember();
      
      if(memberVO != null) {
         
         //  마이페이지에서 지원현황 지원완료애들 정보가져오기 
         List<ApplyVO> applyList = mypageService.failApplySuccess(memberVO.getMemId());
         return new ResponseEntity<List<ApplyVO>>(applyList,HttpStatus.OK);
      }
      
      return null;
   }
   
   
   
   @PreAuthorize("hasRole('ROLE_SEEKER')")
   @RequestMapping(value = "/coteSelect" , method = RequestMethod.GET)
   public String coteSelect(Model model, RecruitmentCodingTestVO recCoteVO) {
      log.info("coteSelect() 실행===========================");      
      log.info("recCoteVO.getRecNtcId() : " + recCoteVO.getRecNtcId());
      // 각 문항에 대한 문항번호를 가져온다.
      List<RecruitmentCodingTestVO> recCoteList = mypageService.coteNoSelect(recCoteVO.getRecNtcId());
      for(int i=0; i< 3; i++) {
         CodingTestVO coteVO = mypageService.getCoteInfo(recCoteList.get(i).getCoteNo());    
         model.addAttribute("model"+i, coteVO);
      }
      RecruitmentNoticeVO recNtcVO = mypageService.selectRecNtc(recCoteVO.getRecNtcId());
      model.addAttribute("recNtcVO", recNtcVO);
      return "cote/mona";
   }
   
   
   // 컴파일 메소드 호출
      @PreAuthorize("hasRole('ROLE_SEEKER')")
      @RequestMapping(value="/compileCode", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
      public ResponseEntity<String> compileMethod(@RequestBody CodingTestVO coteVO) {
         

         String code = coteVO.getCode();
         log.info("code : " + code);
         int res1 = coteVO.getExAnsnum1();
         log.info("res1 : " + res1);
         int res2 = coteVO.getExAnsnum2();
         log.info("res2 : " + res2);
         FileClassLoader fc = new FileClassLoader();
         String result1 = fc.process("Solution", code,res1);
         
         FileClassLoader fc1 = new FileClassLoader();
         String result2 = fc1.process("Solution", code,res2);
         
         int resNum1 = coteVO.getExResnum1();
         String resresNum1 = String.valueOf(resNum1);
         int resNum2 = coteVO.getExResnum2();
         String resresNum2 = String.valueOf(resNum2);
         
         String html = "";
         html += "<p>테스트 1 </p>";
         html += "<p>입력값 > " + res1 + "</p>";
         html += "<p>기댓값 > " + result1 + "</p>";
         if(result1.equals(resresNum1)) {
            html += "<p>테스트를 통과하였습니다.</p><br>";
         }else {
            html += "<p>테스트에 실패하였습니다.</p><br>";
         }
         html += "<p>테스트2</p>";
         html += "<p>입력값 > " + res2 + "</p>";
         html += "<p>기댓값> " + result2 + "</p>";
         if(result2.equals(resresNum2)) {
            html += "<p>테스트를 통과하였습니다.</p><br>";
         }else {
            html += "<p>테스트에 실패하였습니다.</p><br>";
         }
         if(!result1.equals(resresNum1) && !result2.equals(resresNum2)) {
            html += "2개 중 0개 성공";
         }
         else if(result1.equals(resresNum1) && result2.equals(resresNum2)) {
            html += "2개 중 2개 성공";
         }
         else {
            html += "2개 중 1개 성공";
         }
         
         return new ResponseEntity<String>(html,HttpStatus.OK);
      }
   
      @PreAuthorize("hasRole('ROLE_SEEKER')")
      @RequestMapping(value = "/coteInsert", method = RequestMethod.POST)
      public ResponseEntity<ServiceResult> coteInsert(@RequestBody CodingTestVO coteVO){
         Map<String, Object> map = new HashMap<String, Object>();
         ServiceResult result = null;
         // 공고별 코딩테스트 문항 구하기 <= 코딩테스트VO에서 coteNo와 recNtcId가 필요
         map.put("coteNo", coteVO.getCoteNo());
         map.put("recNtcId", coteVO.getRecNtcId());
         int recCodingTestNo = mypageService.getRecCoteNo(map);
         log.info("recCodingTestNo ============" + recCodingTestNo);
         log.info("output ============" + coteVO.getOutput());
         CustomUser user = 
               (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         MemberVO memberVO = user.getMember();
         
         if(memberVO != null) {
            // 지원번호를 구한다.
            map.put("memId",memberVO.getMemId());
            int applyNo = mypageService.getApplyNo(map);
            log.info("applyNo ============" + applyNo);
            
            map.put("output", coteVO.getOutput());
            map.put("applyNo", applyNo);
            map.put("recCodingTestNo", recCodingTestNo);
            
            // insert와 update 처음에는 insert를 해주고 그다음부터는 update를 해준다.
            AnswerCodingTestVO ansCoteVO = mypageService.selectAnswerCodingTest(map);
            if(ansCoteVO != null) {
               // 코딩테스트 답변update하기
               result = mypageService.coteUpdate(map);
            }else {
               // 코딩테스트 답변 insert하기
               result = mypageService.coteInsert(map);
            }
            
            
         }
         
         
         return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
      }
   
      @PreAuthorize("hasRole('ROLE_SEEKER')")
      @ResponseBody
      @RequestMapping(value = "/updateTestStatus" , method = RequestMethod.POST)
      public ResponseEntity<ServiceResult> updateTestStatus(@RequestBody ApplyVO applyVO){
         ServiceResult result = null;
         Map<String, Object> map = new HashMap<String, Object>();
            map.put("recNtcId", applyVO.getRecNtcId());
            log.info("applyVO.getRecNtcId()===========" + applyVO.getRecNtcId());
         CustomUser user = 
               (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         MemberVO memberVO = user.getMember();
         
         if(memberVO != null) {
            map.put("memId", memberVO.getMemId());
            // applyNo(지원번호) 구하기
            int applyNo = mypageService.getApplyNo(map);
            log.info("getApplyNo(map) =================" +applyNo);
            // 시험응시 -> 응시완료 바꾸기
            map.put("applyNo", applyNo);
            result = mypageService.updateTestStatus(map);
         }
         
         
         return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
      }
}
