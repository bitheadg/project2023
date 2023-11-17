
package aa.config;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;


@Configuration
public class I18n extends ReloadableResourceBundleMessageSource implements WebMvcConfigurer{

	private static final Logger L = LoggerFactory.getLogger(HandlerInterceptor.class);
	
	@Value("${spring.messages.basename}")
	String messagesBasename = null;
	@Value("${spring.messages.encoding}")
	String messagesEncoding = null;
	@Value("${spring.messages.cache-seconds}")
	int messagesCacheSeconds;

	@Bean
    public ReloadableResourceBundleMessageSource messageSource(){ //exposured as this method name
      ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
      messageSource.setBasename(messagesBasename);                //"classpath:/path/fileprefix"
      messageSource.setDefaultEncoding(messagesEncoding);
      /*Default is -1, indicating no generation of cache-related headers.
		Only if this is set to 0 (no cache, immediately) or a positive value (cache for this many seconds) will this class generate cache headers.*/
      messageSource.setCacheSeconds(messagesCacheSeconds);
      return messageSource;
	}    		  
	/*or
	@Bean(name="messageSource")
	public ReloadableResourceBundleMessageSource yourMessageSource() {}
	*/
	
	//best practice: better to define one MessageSource per context and inject them according to your context:
	@Value("${spring.messages.nochangebasename}")
	String fixedmessagesBasename = null;
	@Bean(name="fixedMessageSource")
	public ResourceBundleMessageSource customdMessageSource() {
		ResourceBundleMessageSource s = new ResourceBundleMessageSource();
		s.setBasename(fixedmessagesBasename);
		//s.setBasenames(fixedmessagesBasename, "i18n/brand");//No message found under code 'bbs.writer' for locale 'ko_KR'.
		s.setDefaultEncoding(messagesEncoding);
		//s.setCacheSeconds(messagesCacheSeconds);//meaningful here? No
	    return s;
	}
	
	
	@Bean
	public LocaleResolver localeResolver() { //determine the current locale based on the session, cookies, the Accept-Language header, or a fixed value.
	    SessionLocaleResolver slr = new SessionLocaleResolver();
	    slr.setDefaultLocale(Locale.US);
	    return slr;
	}
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() { //To achieve this, our @Configuration class has to implement the WebMvcConfigurer interface and override the addInterceptors() method:
	    LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
	    lci.setParamName("lang"); //expecting ko_KR type properties, because we will have only these types
	    return lci;
	}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(localeChangeInterceptor());
	}


}
