package com.web.innjoy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.innjoy.vo.ChatBsn;
import com.web.innjoy.vo.ChatMessage;
import com.web.innjoy.vo.ChatRoom;
import com.web.innjoy.vo.ChatUser;
import com.web.innjoy.vo.ProductBsn;

@Mapper
public interface ChatDao {
	// 채팅 방 만들기
    void createChatRoom(ChatRoom chatRoom);
    
    // 룸id로 채팅방 찾기 //
    ChatRoom getChatRoomByRoomId(int room_id);
    
    // 룸id로 기존의 채팅 가져오기 //
    List<ChatMessage> getChatMessagesByRoomId(int room_id);
    
    // 새로 입력채팅 저장 //
    void saveChatMessage(ChatMessage chatMessage);
   
    // 룸 리스트 - 사업자 회원 //
    List<ChatUser> getChatRoomsByReceiverUser(String re_user);
    
    // 룸 리스트 - 일반 회원 //
    List<ChatBsn> getChatRoomsByReceiverUser2(String se_user);
    
    // 채팅방 생성 //
    void insertChatRoom(ChatRoom chatRoom);
    
    // 채팅방 생성 또는 가져오기
    ChatRoom getChatRoomByUsers(String se_user, String re_user);
    
    // 일반회원페이지에서 문의하기 버튼 클릭시 room_id 넘기기
    int createChatRoomAndGetId(ChatRoom chatRoom);
    
    ProductBsn FindCeoName(int pro_id);
}

