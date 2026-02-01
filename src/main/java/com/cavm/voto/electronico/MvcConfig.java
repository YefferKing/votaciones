package com.cavm.voto.electronico;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/error_403").setViewName("error_403");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// Mapeamos la URL /uploads/** a la carpeta física /tmp/uploads/ en Render/Linux
		// También incluimos la ruta local por si acaso para desarrollo
		registry.addResourceHandler("/uploads/**")
				.addResourceLocations("file:/tmp/uploads/", "file:src/main/resources/static/uploads/");
	}
}
