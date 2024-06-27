package com.gsm.bb.config;


import org.springframework.context.annotation.Bean; 

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Configuration
@EnableWebMvc
@EnableLoadTimeWeaving
@EnableJpaRepositories(basePackages = "com.gsm.bb.repository")
@ComponentScan({"com.gsm.bb"})


public class TeluskoConfig {
	@Bean
	public InternalResourceViewResolver  viewResolover() {
		
		InternalResourceViewResolver vr  = new InternalResourceViewResolver();
		
		vr.setPrefix("/WEB-INF/");
		vr.setSuffix(".jsp");
		
		
		return vr;
	}
	
	 @Bean(name = "multipartResolver")
	    public StandardServletMultipartResolver multipartResolver() {
	        return new StandardServletMultipartResolver();
	    }
	 
	
}
