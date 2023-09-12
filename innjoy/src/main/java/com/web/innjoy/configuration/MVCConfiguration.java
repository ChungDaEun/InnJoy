package com.web.innjoy.configuration;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfiguration implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**")
				.addResourceLocations("classpath:/templates/",
									  "classpath:/static/");
	}

	// ResponseEntity<객체>를 리턴할 때, json으로 변경처리
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}

	
}
