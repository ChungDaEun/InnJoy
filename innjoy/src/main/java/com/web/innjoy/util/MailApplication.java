package com.web.innjoy.util;

import java.util.Properties;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@SpringBootApplication
public class MailApplication {
	 
    public static void main(String[] args) {
        SpringApplication.run(MailApplication.class, args);
    }
    
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.gmail.com");
        javaMailSender.setPort(587);
        javaMailSender.setUsername("padid78111@gmail.com");
        javaMailSender.setPassword("bovwetmkquarznem");
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        javaMailSender.setJavaMailProperties(properties);
        
        return javaMailSender;
    }
}
