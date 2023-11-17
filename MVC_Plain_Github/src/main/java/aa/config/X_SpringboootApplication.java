
package aa.config;

import java.util.Arrays;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Profile;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;

@Profile({ "local.xa.springboot.embeddedTomcat" })
@SpringBootApplication
@ComponentScan("aa") //go to the top level, without this only the present package will be scanned
public class X_SpringboootApplication {

	@Autowired
    //MessageSource messageSource;
	ReloadableResourceBundleMessageSource messageSource;
	
	@Autowired
	ResourceBundleMessageSource fixedMessageSource;
	
	public static void main(String[] args) {
		SpringApplication.run(X_SpringboootApplication.class, args);
	}

	@Bean
	public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
		return args -> {

			System.out.println("Let's inspect the beans provided by Spring Boot:");

			String[] beanNames = ctx.getBeanDefinitionNames();
			Arrays.sort(beanNames);
			for (String beanName : beanNames) {
				//System.out.println(beanName);
			}
			
			/*
			System.out.println("Current defaultLocale: "+Locale.getDefault());
			Locale.setDefault(Locale.KOREA);
			System.out.println("After set defaultLocale as KOREA: "+Locale.getDefault());
			*/

			//not frequently changed
			System.out.println("i18n test:"+fixedMessageSource.getMessage("bbs.writer", null, Locale.getDefault()));
			
			//frequently changed
			System.out.println("i18n test:"+messageSource.getMessage("bbs.writer", null, Locale.KOREA));
			System.out.println("i18n test:"+messageSource.getMessage("bbs.writer", null, Locale.US));
			


		};
	}

}
