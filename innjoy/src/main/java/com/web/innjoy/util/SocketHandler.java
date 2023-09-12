package com.web.innjoy.util;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.web.innjoy.service.ChatService;
import com.web.innjoy.vo.ChatMessage;

@Component
public class SocketHandler extends TextWebSocketHandler {
    private final ChatService chatService;
    private final Map<String, Map<String, WebSocketSession>> roomSessionsMap = new ConcurrentHashMap<>();

    @Autowired
    public SocketHandler(ChatService chatService) {
        this.chatService = chatService;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결
        super.afterConnectionEstablished(session);
        String url = session.getUri().toString();
        System.out.println(url);
        String room_id = url.split("/chating/")[1];

        roomSessionsMap.computeIfAbsent(room_id, key -> new ConcurrentHashMap<>())
                .put(session.getId(), session);

        // 세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
        JSONObject obj = new JSONObject();
        obj.put("type", "getId");
        obj.put("sessionId", session.getId());
        session.sendMessage(new TextMessage(obj.toJSONString()));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료
        for (Map<String, WebSocketSession> roomSessions : roomSessionsMap.values()) {
            roomSessions.remove(session.getId());
        }
        super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        System.out.println("Received message: " + payload);

        // Parse the received JSON message
        JSONObject jsonMessage = jsonToObjectParser(payload);
        String room_id = jsonMessage.get("room_id").toString();

        // Broadcast the message to all connected sessions in the same room
        for (Map<String, WebSocketSession> roomSessions : roomSessionsMap.values()) {
            WebSocketSession otherSession = roomSessions.get(session.getId());
            if (otherSession != null && otherSession.isOpen() && room_id.equals(otherSession.getAttributes().get("room_id"))) {
                otherSession.sendMessage(message);
            }
        }

        storeMessageInDatabase(jsonMessage);
    }
    
    private void storeMessageInDatabase(JSONObject jsonMessage) {
        int room_id = Integer.parseInt(jsonMessage.get("room_id").toString());
        String sender = jsonMessage.get("sender").toString();
        String message = jsonMessage.get("msg").toString();

        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRoom_id(room_id);
        chatMessage.setSender(sender);
        chatMessage.setMessage(message);

        // Call the service to store the message
        chatService.saveChatMessage(chatMessage);
        System.out.println("Message stored in the database: " + jsonMessage);
    }
}
