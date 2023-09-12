package com.web.innjoy.configuration;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.web.innjoy.controller.filter.LoginFilter;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean<LoginFilter> sessionExpirationFilter() {
        FilterRegistrationBean<LoginFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new LoginFilter());
        registrationBean.addUrlPatterns("/sec/**");
        return registrationBean;
    }
}