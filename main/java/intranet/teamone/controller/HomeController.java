package intranet.teamone.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	ModelAndView mav;		
	
	@GetMapping("/")
	public String home() {
		
		return "accessForm";
	}
	
	@GetMapping("/home")
	public String mainPage() {
		return "homeNSB";
	}
	
	@GetMapping("/test")
	public String sdfsw() {
		return "testset";
	}
}
