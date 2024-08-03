package kr.or.ddit.controller.common;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.google.gson.JsonObject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.IApplicantMgmtService;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EchoHandler extends TextWebSocketHandler {

    private static List<WebSocketSession> list = new ArrayList<>();

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Inject
    IApplicantMgmtService applicantMgmtService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("## 누군가 접속");
        list.add(session);
        log.info("Session added: " + session.getId());
        Principal principal = session.getPrincipal();
        if (principal != null) {
            log.info("Principal: " + principal.getName());
        } else {
            log.warn("Principal is null in afterConnectionEstablished");
        }
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        if (isJson(message)) {
            Map<String, Object> map = objectMapper.readValue(message.getPayload(), Map.class);
            log.info("Received message: " + map);
            String code = (String) map.get("code");
            if ("success".equals(code) || "fail".equals(code)) {
                sendAlarm(session, map);
            }
        } else {
            log.warn("Received non-JSON message: " + message.getPayload());
        }
    }

    private void sendAlarm(WebSocketSession session, Map<String, Object> map) throws IOException {
        int applyNo = -1;
        int proNo = -1;
        String memId = null;

        // applyNo 처리
        if (map.containsKey("applyNo")) {
            try {
                applyNo = Integer.parseInt(map.get("applyNo").toString());
                memId = applicantMgmtService.getMemid(applyNo);
            } catch (NumberFormatException e) {
                log.error("Invalid applyNo format: " + map.get("applyNo"));
                return;
            }
        }

        // proNo 처리
        if (map.containsKey("proNo")) {
            try {
                proNo = Integer.parseInt(map.get("proNo").toString());
                String newMemId = applicantMgmtService.getMemId2(proNo);
                if (newMemId != null) {
                    memId = newMemId;
                } else {
                    log.warn("getMemId2 returned null for proNo: " + proNo);
                }
            } catch (NumberFormatException e) {
                log.error("Invalid proNo format: " + map.get("proNo"));
                return;
            }
        }

        // memId가 null인 경우 처리
        if (memId == null) {
            log.error("memId is null for applyNo: " + applyNo + " and proNo: " + proNo);
            return;
        }

        String content = (String) map.get("content");

        log.debug("applyNO : " + applyNo);
        log.debug("proNo : " + proNo);
        log.debug("memId : " + memId);
        log.debug("content : " + content);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("type", "alarm");
        jsonObject.addProperty("data", content);

        String jsonMsg = jsonObject.toString();

        for (WebSocketSession webSocketSession : list) {
            MemberVO myInfo = getMyInfo(webSocketSession);
            if (myInfo != null) {
                log.info("Sending alarm to memId: " + myInfo.getMemId());
                if (myInfo.getMemId().equals(memId)) {
                    webSocketSession.sendMessage(new TextMessage(jsonMsg));
                }
            } else {
                log.warn("myInfo is null for session: " + webSocketSession.getId());
            }
        }
    }

    private boolean isJson(TextMessage message) {
        try {
            objectMapper.readTree(message.getPayload());
            return true;
        } catch (Exception e) {
            log.error("Invalid JSON format: " + message.getPayload(), e);
            return false;
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info("소켓 끊음");
        list.remove(session);
    }

    private MemberVO getMyInfo(WebSocketSession session) {
        Principal principal = session.getPrincipal();
        if (principal != null) {
            log.info("Principal in getMyInfo: " + principal.getName());
            if (principal instanceof Authentication) {
                Authentication authentication = (Authentication) principal;
                if (authentication.getPrincipal() instanceof CustomUser) {
                    return ((CustomUser) authentication.getPrincipal()).getMember();
                }
            }
        } else {
            log.warn("Principal is null in getMyInfo for session: " + session.getId());
        }
        return null;
    }
}