package intranet.teamone.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import intranet.teamone.utils.Encryption;
import intranet.teamone.utils.ProjectUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeControllerCJH {
	@Autowired
	private ProjectUtils pu;
    @Autowired
	Encryption enc;
	
	
	@GetMapping("/cjh")
	public String home() throws Exception {
		pu.setAttribute("cld","EI01sMOpPT3/l7D2mSsgzA==");
		pu.setAttribute("clp","53D1d7E5HaiPOYKNcQs+jw==");
		return "homeCJH";
	}
	 
}
