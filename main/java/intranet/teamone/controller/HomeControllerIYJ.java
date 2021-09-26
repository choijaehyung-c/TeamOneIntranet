package intranet.teamone.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeControllerIYJ {
	
	ModelAndView mav;		
	
	@GetMapping("/homeiyj")
	public String mainPage() {
		return "homeIYJ";
	}
	
	@GetMapping("/test12")
	public String testPage() {
		return "NewFile1";
	}
}
