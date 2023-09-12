package com.web.innjoy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessagingTemplate;

@SpringBootApplication
public class InnjoyApplication {

	public static void main(String[] args) {
		SpringApplication.run(InnjoyApplication.class, args);
	}

}
