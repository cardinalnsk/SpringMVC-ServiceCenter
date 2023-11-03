package ru.cardinal.servicecentr.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

  @Value("${upload.path}")
  private String uploadPath;

  @Override
  public void addViewControllers(ViewControllerRegistry registry) {
    registry.addViewController("/login").setViewName("login");
    registry.addViewController("/").setViewName("redirect:/device");
    registry.addViewController("/registration").setViewName("registration");
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/img/**")
            .addResourceLocations("file://" + uploadPath + "/");
    registry.addResourceHandler("/images/**")
            .addResourceLocations("classpath:/static/images/");
    registry.addResourceHandler( "/resources/**")
            .addResourceLocations("classpath:/resources/");
    registry.addResourceHandler( "/scripts/**")
            .addResourceLocations("classpath:/static/scripts/");
  }
}
