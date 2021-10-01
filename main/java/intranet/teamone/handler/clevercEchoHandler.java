package intranet.teamone.handler;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import intranet.teamone.utils.Encryption;



public class clevercEchoHandler extends TextWebSocketHandler{

	
	
		/*
		 * private List<WebSocketSession> sessionList = new
		 * ArrayList<WebSocketSession>();
		 */
    private static Logger logger = LoggerFactory.getLogger(clevercEchoHandler.class);
    private Map<String,List<WebSocketSession>> userSesssion = new HashMap<>();
    
     
    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	String userId = this.getId(session);
    	if(!userId.equals("none")) {
	        if(userSesssion.containsKey(userId)) {
	        	List<WebSocketSession> list = userSesssion.get(userId); 
	        	list.add(session);
	        	userSesssion.put(userId,list);
	        }else {
	        	List<WebSocketSession> list = new ArrayList<>();
	        	list.add(session);
	        	userSesssion.put(userId,list);
	        }
	        logger.info(session.getId(),userId+session+"추가");
    	}
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Date today = new Date();
        SimpleDateFormat time = new SimpleDateFormat("HH:mm");
        for(WebSocketSession sess : userSesssion.get(message.getPayload().substring(0,8))){
            sess.sendMessage(new TextMessage(time.format(today)+message.getPayload().substring(8)));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	String userId = this.getId(session);
    	if(!userId.equals("none")) {
	    	if(userSesssion.containsKey(userId)) {
	    		int size = userSesssion.get(userId).size();
	    		for(int i = 0 ; i <size ; i++) {
	    			if(userSesssion.get(userId).get(i).equals(session)) {
	    				userSesssion.get(userId).remove(i);
	    				logger.info(session.getId(),userId+session+"제거");
	    			}
	    		}
	    	}
    	}
    }
	
    private String getId(WebSocketSession session) {
    	Map<String,Object> httpSession = session.getAttributes();
    	String userSs;
		try {
			userSs = (String)httpSession.get("userOf")+(String)httpSession.get("userDp");
		} catch (Exception e) {
			userSs="none";
		}
    	return userSs.equals("nullnull")?"none":userSs;
    }
	
}
