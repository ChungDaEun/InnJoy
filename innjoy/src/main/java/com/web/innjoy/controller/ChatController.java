package com.web.innjoy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.innjoy.service.ChatService;
import com.web.innjoy.vo.ChatBsn;
import com.web.innjoy.vo.ChatMessage;
import com.web.innjoy.vo.ChatRoom;
import com.web.innjoy.vo.ChatUser;
import com.web.innjoy.vo.ProductBsn;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {
    @Autowired
    private ChatService chatService;

    @RequestMapping("/chat")
    public ModelAndView chat() {
        ModelAndView mv = new ModelAndView("bsn/bsn_inq_chatt");
        return mv;
    }

    // 사업자에서 채팅방 입장
    @GetMapping("/moveChating")
    public String moveChating(
            @RequestParam("se_user") String seUser,
            @RequestParam("re_user") String reUser,
            @RequestParam("room_id") int room_id,
            @RequestParam("user_name") String user_name,
            HttpServletRequest request,
            Model model
    ) {
        ChatRoom chatRoom = chatService.getChatRoomByRoomId(room_id);
        List<ChatMessage> chatMessages 
        	= chatService.getChatMessagesByRoomId(room_id);

        model.addAttribute("chatRoom", chatRoom);
        model.addAttribute("chatMessages", chatMessages);
        model.addAttribute("room_id", room_id);
        model.addAttribute("se_user", seUser);
        model.addAttribute("re_user", reUser);
        model.addAttribute("user_name", user_name);

        return "bsn/bsn_inq_chatt";
    }
    
    // 일반회원 채팅방입장
    @GetMapping("/moveChating2")
    public String moveChating2(
            @RequestParam("se_user") String seUser,
            @RequestParam("re_user") String reUser,
            @RequestParam("room_id") int room_id,
            @RequestParam("ceo_name") String ceo_name,
            HttpServletRequest request,
            Model model,
            HttpSession session
    ) {
        ChatRoom chatRoom = chatService.getChatRoomByRoomId(room_id);
        List<ChatMessage> chatMessages 
        	= chatService.getChatMessagesByRoomId(room_id);
        
        
        model.addAttribute("chatRoom", chatRoom);
        model.addAttribute("chatMessages", chatMessages);
        model.addAttribute("room_id", room_id);
        model.addAttribute("se_user", seUser);
        model.addAttribute("re_user", reUser);
        model.addAttribute("ceo_name", ceo_name);
        
        return "user/user_inq_chatt";
    }
    // 숙소 상세에서 채팅방입장
    @GetMapping("/moveChating3")
    public String moveChating3(
            @RequestParam("se_user") String seUser,
            @RequestParam("re_user") String reUser,
            @RequestParam("room_id") int room_id,
            @RequestParam("ceo_name") String ceo_name,
            @RequestParam("pro_id") int pro_id,
            HttpServletRequest request,
            Model model,
            HttpSession session
    ) {
        ChatRoom chatRoom = chatService.getChatRoomByRoomId(room_id);
        List<ChatMessage> chatMessages 
           = chatService.getChatMessagesByRoomId(room_id);
       
        ProductBsn productBsn = chatService.FindCeoName(pro_id);
        if (productBsn != null) {
            ceo_name = productBsn.getBsn_user().getCeo_name();
        }
        
        model.addAttribute("chatRoom", chatRoom);
        model.addAttribute("chatMessages", chatMessages);
        model.addAttribute("room_id", room_id);
        model.addAttribute("se_user", seUser);
        model.addAttribute("re_user", reUser);
        model.addAttribute("ceo_name", ceo_name);
        model.addAttribute("pro_id", pro_id);
        
        return "user/user_inq_chatt";
    } 
    
    
    // 사업자 회원 세션값으로 룸 리스트 갖고오기
    @RequestMapping("/getRoom")
    public @ResponseBody List<ChatUser> getRooms(HttpSession session) {
        String bsnId = (String) session.getAttribute("bsnId");
        List<ChatUser> roomList = chatService.getChatRoomsByReceiverUser(bsnId);
        return roomList;
    }
    // 일반 회원 세션값으로 룸 리스트 갖고오기
    @RequestMapping("/getRoom2")
    public @ResponseBody List<ChatBsn> getRooms2(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        List<ChatBsn> roomList = chatService.getChatRoomsByReceiverUser2(userId);
        return roomList;
    }
    
    // 사업자에서 메세지 보내고 저장하기
    @PostMapping("/sendMessage")
    @ResponseBody
    public void sendMessage(
            @RequestParam("room_id") int room_id,
            @RequestParam("re_user") String re_user,
            @RequestParam("se_user") String se_user,
            @RequestParam("msg") String msg
    ) {
        ChatRoom chatRoom = chatService.getChatRoomByRoomId(room_id);
        
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRoom_id(room_id);
        
        if (se_user.equals(chatRoom.getSe_user())) {
            chatMessage.setSender(re_user);
        } else if (re_user.equals(chatRoom.getRe_user())) {
            chatMessage.setSender(se_user);
        }
        
        chatMessage.setMessage(msg);
        chatService.saveChatMessage(chatMessage);
    }
    // 사용자에서 메세지 보내고 저장하기
    @PostMapping("/sendMessage2")
    @ResponseBody
    public void sendMessage2(
            @RequestParam("room_id") int room_id,
            @RequestParam("re_user") String re_user,
            @RequestParam("se_user") String se_user,
            @RequestParam("msg") String msg
    ) {
        ChatRoom chatRoom = chatService.getChatRoomByRoomId(room_id);
        
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRoom_id(room_id);
        
        if (se_user.equals(chatRoom.getSe_user())) {
            chatMessage.setSender(se_user);
        } else if (re_user.equals(chatRoom.getRe_user())) {
            chatMessage.setSender(re_user);
        }
        
        chatMessage.setMessage(msg);
        chatService.saveChatMessage(chatMessage);
    }    
     
    // 일반회원페이지에서 채팅방 추가
    @PostMapping("/enterChatRoom")
    @ResponseBody
    public ResponseEntity<String> enterChatRoom(
    		@RequestParam String se_user, @RequestParam String re_user) {
        int room_id = chatService.getOrCreateChatRoom(se_user, re_user);
        return ResponseEntity.ok(String.valueOf(room_id));
    }
    
    // 일반회원페이지에서 문의하기 버튼 클릭시 room_id 넘기기
    @RequestMapping("/enterChatRoom")
    @ResponseBody
    public ResponseEntity<Integer> enterChatRoom2(
    		@RequestParam String se_user, @RequestParam String re_user) {
        int room_id = chatService.getOrCreateChatRoom2(se_user, re_user);
        return ResponseEntity.ok(room_id);
    }

    
}