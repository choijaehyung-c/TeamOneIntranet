package intranet.teamone.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class clevercEchoHandler extends TextWebSocketHandler{

	 //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private Map<String,WebSocketSession> userSesssion = new HashMap<>();
    private static Logger logger = LoggerFactory.getLogger(clevercEchoHandler.class);
    SimpleDateFormat time = new SimpleDateFormat("HH-mm-ss");

    
    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        userSesssion.put(this.getId(session),session);
        //map value 에다가 ArrayList 고려
        
		/* logger.info("{} 연결됨", session.getId()); */
        Date today = new Date();
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getRemoteAddress().toString().split(":")[0].substring(1)+"님("+time.format(today)+") 입장"));
        }
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		/* logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload()); */
        //모든 유저에게 메세지 출력
        Date today = new Date();
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getRemoteAddress().toString().split(":")[0].substring(1)+"님("+time.format(today)+")  :  "+message.getPayload()));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        userSesssion.remove(this.getId(session));
		/* logger.info("{} 연결 끊김.", session.getId()); */
        Date today = new Date();
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getRemoteAddress().toString().split(":")[0].substring(1)+"님("+time.format(today)+") 퇴장"));
        }
    }
	
    private String getId(WebSocketSession session) {
    	Map<String,Object> httpSession = session.getAttributes();
    	String userSs = (String)httpSession.get("userSs");
    	return userSs;
    }
	
}
