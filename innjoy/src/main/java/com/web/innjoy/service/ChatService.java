package com.web.innjoy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dao.ChatDao;
import com.web.innjoy.vo.ChatBsn;
import com.web.innjoy.vo.ChatMessage;
import com.web.innjoy.vo.ChatRoom;
import com.web.innjoy.vo.ChatUser;
import com.web.innjoy.vo.ProductBsn;

@Service
public class ChatService {
    @Autowired
    private ChatDao dao;
    // 숙소 상세에서 버튼 클릭했는데 채팅방 없을 시 채팅방 생성
    public void createChatRoom(String se_user, String re_user) {
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setSe_user(se_user);
        chatRoom.setRe_user(re_user);
        dao.createChatRoom(chatRoom);
    }
    
    // 룸 리스트 - 사업자 //
    public List<ChatUser> getChatRoomsByReceiverUser(String re_user) {
        return dao.getChatRoomsByReceiverUser(re_user);
    }
    
    // 룸 리스트 - 일반회원 //
    public List<ChatBsn> getChatRoomsByReceiverUser2(String se_user) {
        return dao.getChatRoomsByReceiverUser2(se_user);
    }
    
    // 버튼 클릭시 채팅방 가져오기 //
    public ChatRoom getChatRoomByRoomId(int room_id) {
        return dao.getChatRoomByRoomId(room_id);
    }

    // 룸id에 해당하는 채팅 가져오기 //
    public List<ChatMessage> getChatMessagesByRoomId(int room_id) {
        return dao.getChatMessagesByRoomId(room_id);
    }
    
    // 메세지 전송 insert //
    public void saveChatMessage(ChatMessage chatMessage) {
        dao.saveChatMessage(chatMessage);
    } 
    
    
    // 일반회원페이지에서 채팅방 insert
    public int getOrCreateChatRoom(String se_user, String re_user) {
        ChatRoom existingRoom = dao.getChatRoomByUsers(se_user, re_user);
        if (existingRoom != null) {
            return existingRoom.getRoom_id();
        } else {
            ChatRoom newChatRoom = new ChatRoom();
            newChatRoom.setSe_user(se_user);
            newChatRoom.setRe_user(re_user);
            dao.createChatRoom(newChatRoom);
            return newChatRoom.getRoom_id();
        }
    }
    
    // 일반회원페이지에서 문의하기 버튼 클릭시 room_id 넘기기
    public int getOrCreateChatRoom2(String se_user, String re_user) {
        ChatRoom existingRoom = dao.getChatRoomByUsers(se_user, re_user);
        if (existingRoom != null) {
            return existingRoom.getRoom_id();
        } else {
            ChatRoom newChatRoom = new ChatRoom();
            newChatRoom.setSe_user(se_user);
            newChatRoom.setRe_user(re_user);
            int room_id = dao.createChatRoomAndGetId(newChatRoom);
            return room_id;
        }
    }
    
    public ProductBsn FindCeoName(int Pro_id) {
    	return dao.FindCeoName(Pro_id);
    }
    
}