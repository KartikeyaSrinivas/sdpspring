package com.health.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;


@SpringBootApplication
public class SdpApplication extends SpringBootServletInitializer 
{
  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
  {
    return application.sources(SpringBootServletInitializer.class);
  }
	public static void main(String[] args) 
	{
		SpringApplication.run(SdpApplication.class, args);
	}
	@Bean
	  public RestTemplate getRestTemplate()
	  {
	    return new RestTemplate();
	  }

}
