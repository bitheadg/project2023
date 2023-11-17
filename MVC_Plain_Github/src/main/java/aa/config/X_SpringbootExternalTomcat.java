package aa.config;

import java.util.Arrays;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Profile;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;

@Profile({ "local.xa.springboot.externalTomcat" })
@SpringBootApplication
@ComponentScan("aa")
public class X_SpringbootExternalTomcat extends SpringBootServletInitializer {
	@Autowired
    //MessageSource messageSource;
	ReloadableResourceBundleMessageSource messageSource;
	
	@Autowired
	ResourceBundleMessageSource fixedMessageSource;
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(X_SpringbootExternalTomcat.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(X_SpringbootExternalTomcat.class, args);
	}

	@Bean
	public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
		return args -> {

			System.out.println("Let's inspect the beans provided by Spring Boot:");

			String[] beanNames = ctx.getBeanDefinitionNames();
			Arrays.sort(beanNames);
			for (String beanName : beanNames) {
				System.out.println(beanName);
			}
			
			//not frequently changed
			System.out.println("i18n test:"+fixedMessageSource.getMessage("bbs.writer", null, Locale.getDefault()));
			
			//frequently changed
			System.out.println("i18n test:"+messageSource.getMessage("bbs.writer", null, Locale.KOREA));
			System.out.println("i18n test:"+messageSource.getMessage("bbs.writer", null, Locale.US));

		};
		

	}

}