package com.web.store.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("com.web.store")
public class WebAppConfig implements WebMvcConfigurer {
	@Bean
	public ViewResolver resolver() {
		InternalResourceViewResolver vr = new InternalResourceViewResolver();
		// vr.setViewClass(JstlView.class);
		// "/WEB-INF/views/" + logicalName + ".jsp"
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
		return vr;
	}
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
		resource.setBasename("messages");
		return resource;
	}

	//可用內建的
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configuer) {
		configuer.enable();
	}

	@Override
	// 應用系統必須透過ResourceHandlerRegistry的輔助，以便處理靜態檔案：
	// 只要請求路徑是以/css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
	// 只要請求路徑是以/image/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/css/");
		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/views/img/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/views/js/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/views/fonts/");
		registry.addResourceHandler("/scss/**").addResourceLocations("/WEB-INF/views/scss/");
		registry.addResourceHandler("/plugins/**").addResourceLocations("/WEB-INF/views/crm/plugins/");
		registry.addResourceHandler("/dist/**").addResourceLocations("/WEB-INF/views/crm/dist/");
		registry.addResourceHandler("/bootstrap/**").addResourceLocations("/WEB-INF/views/crm/bootstrap/");
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
}
