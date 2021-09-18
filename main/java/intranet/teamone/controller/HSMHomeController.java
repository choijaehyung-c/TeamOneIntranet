package intranet.teamone.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HSMHomeController {
	
	ModelAndView mav;		
	
	
	@GetMapping("/hsmhome")
	public String mainPage() {
		return "HSMhome";
	}
	
}
