package intranet.teamone.controller;


import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import intranet.teamone.auth.Authentication;
import intranet.teamone.bean.AccessHistoryBean;
import intranet.teamone.utils.Encryption;


@Controller
public class HomeController {
   ModelAndView mav;
   @Autowired
   Authentication auth;
   @Autowired
   Encryption enc;
   
   @RequestMapping(value = "/", method = {RequestMethod.POST,RequestMethod.GET} )
   public ModelAndView home(@CookieValue(value = "keykey2", required = false)Cookie ck,HttpServletResponse res) {
      mav = auth.start(ck);
      if(ck !=null)res.addCookie(ck);
      return mav;
   }
   
   @PostMapping("/AccessIntranet")
   public ModelAndView accessIntranet(@ModelAttribute AccessHistoryBean ah,HttpServletResponse res) {
      Cookie ck = new Cookie("keykey2",null);
      mav = auth.accessIntranetCtl(ah,ck);
      if(ck.getValue()!=null) res.addCookie(ck);
      return mav;
   }
   
   @PostMapping("/AccessOutIntranet")
   public ModelAndView accessOutIntranet(@ModelAttribute AccessHistoryBean ah,@CookieValue(value = "keykey2", required = false) Cookie ck,HttpServletResponse res) {
      mav = auth.accessOutIntranetCtl(ah,ck);
      res.addCookie(ck);
      return mav;
   }
   
   /*
    * @GetMapping("/test") public ModelAndView test() { mav = new ModelAndView();
    * mav.addObject("testdata",td.test2()); mav.setViewName("/test"); return mav; }
    */
   
}