package intranet.teamone.auth;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import intranet.teamone.bean.AccessBean;
import intranet.teamone.bean.AccessHistoryBean;
import intranet.teamone.utils.Encryption;
import intranet.teamone.utils.ProjectUtils;



@Service
public class Authentication {
   private ModelAndView mav = null;
   @Autowired
   private ProjectUtils pu;
   @Autowired
   Encryption enc;
   @Autowired
   AuthDao dao;
   
   public ModelAndView accessIntranetCtl(AccessHistoryBean ah,Cookie ck) {
      mav = new ModelAndView();
      try {
         //해당 아이디 로그인이 어딘가에서 된상태(db에 로그인상태)
         if(dao.getAccessHistorySum(ah)) {
            // 그 로그인이 다른브라우저에 되어 있을경우 강제종료후 로그인
            if(!(ah.getAh_browser()+ah.getAh_publicip()+ah.getAh_privateip()).equals(dao.getLastAccessInfo(ah))) {    
               if(dao.forceLogout(ah)) {
                  System.out.print("강제로그아웃성공");
                  loginProcessIntranet(mav,ah,ck);
                  System.out.println("다른브라우저로그인성공");
               }
            }else {
               if(pu.getAttribute("userSs")==null){//서버 로그인이 되어있지만 세션이 만료된 경우
                  dao.forceLogout(ah);
                  loginProcessIntranet(mav,ah,ck);
               }else {//서버 로그인이 되어있고 세션이 살아 있는 경우(같은 브라우저,새탭 페이지안바뀐 로그인버튼)
                  mav.setViewName("redirect:/");
               }
            }
         //해당 아이디가 로그인이 안되어있을경우(db에 로그아웃상태)
         }else{
            loginProcessIntranet(mav,ah,ck);
         }
      }catch (Exception e) {
         e.printStackTrace();
      }
      return mav;
   }

   private void loginProcessIntranet(ModelAndView mav,AccessHistoryBean ah,Cookie ck) {
      AccessBean ab = new AccessBean();
         ab.setId(ah.getAh_epcode());
         ab.setPwd(ah.getAh_pwd());
         ab.setCol("EP_CODE");
         ab.setCol2("EP_PWD");
         ab.setTable("EP");
      
      
      try {   
         if(pu.getAttribute("userSs")==null){
            boolean tf = false;
            if(dao.isUserId(ab)){
               System.out.println("아이디검증성공");
               ab.setPwd(enc.aesEncode(ab.getPwd(),ah.getAh_epcode()));
               if(dao.checkPwd(ab)){
                  System.out.println("로그인성공");
                  if(tf = dao.insAccessHistory(ah)) {
                     System.out.println("기록성공");
                     
                     mav.setViewName("redirect:/");

                        ck.setValue("mro"+enc.aesEncode(ah.getAh_epcode(),"session"));                  
                     }
                     ck.setMaxAge(60*60*12); // 쿠키 유효기간 설정 (초 단위) : 반나절
                     pu.setAttribute("userSs",enc.aesEncode(ah.getAh_epcode(),"session"));
                  }else {
                     mav.setViewName("accessForm");
                     mav.addObject("message","alert('로그인실패');");
                  }
               }
            if(!tf){
               mav.setViewName("accessForm");
               mav.addObject("message","alert('로그인실패');");
            }
         }         
      }catch (Exception e) {
         e.printStackTrace();
         
      }
   }
   
   public ModelAndView accessOutIntranetCtl(AccessHistoryBean ah,Cookie ck) {
      if(ck != null)
      mav = new ModelAndView();
      try {
         if(pu.getAttribute("userSs") != null) {
            ah.setAh_epcode(enc.aesDecode((String)pu.getAttribute("userSs"),"session"));
            if(dao.getLogOutAccessHistorySum(ah)) { 
            dao.insAccessHistory(ah);
            pu.removeAttribute("userSs");            
            mav.setViewName("redirect:/");
            mav.addObject("message","alert('로그아웃 되었습니다.');");
            System.out.println("로그아웃ctl성공");
            }
         }else{
            mav.setViewName("redirect:/");
            mav.addObject("message","alert('이미 로그아웃 되었습니다.');");
         }
         ck.setMaxAge(0);//쿠키소멸
         ck.setValue(null);//쿠키소멸
      } catch (Exception e) {
         System.out.println("로그아웃 실패");
         e.printStackTrace();
      }
      return mav;
   }
   
   
   
   public ModelAndView start(Cookie ck) {
      mav = new ModelAndView();
      AccessHistoryBean ah = new AccessHistoryBean();
      // userSs 유저 세션
      if(ck != null) {         
      try {
         //브라우저에 일단 세션이 남아 있는 경우
         if(pu.getAttribute("userSs")!=null){
            ah.setAh_epcode(enc.aesDecode((String)pu.getAttribute("userSs"),"session"));
            //남아 있는 세션이(해당아이디가) DB에 로그인 되어 있는상태 => 마이페이지로
            if(dao.getAccessHistorySum(ah) && ck.getValue().substring(3,ck.getValue().length()).equals((String)pu.getAttribute("userSs"))) {
               mav.setViewName("homeIYJ");
               mav.addObject("Name",dao.getUserInfo(ah.getAh_epcode()).getEp_name());
               mav.addObject("Dp",dao.getUserInfo(ah.getAh_epcode()).getDp_name());
               mav.addObject("of", dao.getUserInfo(ah.getAh_epcode()).getOf_name());
               mav.addObject("email", dao.getUserInfo(ah.getAh_epcode()).getEp_email());
            //남아 있는 세션이(해당아이디가) DB에선 이미 로그아웃된경우 =>해당브라우저에 남아있던 세션도 죽임(꼭 새로고침 안해줘도됨 인터넷창 닫으면 어차피 세션 사라짐)
            }else{
               pu.removeAttribute("userSs");
               mav.setViewName("accessForm");
               ck.setMaxAge(0);//쿠키소멸
               ck.setValue(null);//쿠키소멸
            }
         //브라우저에 해당사이트 할당된 세션이 없음
         }else {
            ck.setMaxAge(0);//쿠키소멸
            ck.setValue(null);//쿠키소멸
            mav.setViewName("accessForm");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }else {
      mav.setViewName("accessForm");
   }

      return mav;
   }
}