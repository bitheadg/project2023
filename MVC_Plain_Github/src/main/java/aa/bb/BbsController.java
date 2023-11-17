package aa.bb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@RestController
public class BbsController {

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Autowired
    //MessageSource messageSource;
	ReloadableResourceBundleMessageSource messageSource;
	
	@RequestMapping(value = "/ping", method = RequestMethod.GET)
	public String pong() {
	    return "pong";//.jsp
	}
	
	//https://all-record.tistory.com/167
	//https://joont92.github.io/spring/@RequestMapping/
	
}
