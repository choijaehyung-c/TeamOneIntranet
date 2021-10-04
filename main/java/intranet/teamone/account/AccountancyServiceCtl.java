package intranet.teamone.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.BudgetBean;
import intranet.teamone.utils.Encryption;
import intranet.teamone.utils.ProjectUtils;

@Service
public class AccountancyServiceCtl {
   @Autowired
   AccountancyServiceDao dao;
   @Autowired
   ProjectUtils pu;
   @Autowired
   Encryption enc;
   
   

   BudgetBean getBudgetList(){
	   BudgetBean bg = new BudgetBean();
	try {
		bg.setBg_ofcode((String)pu.getAttribute("userOf"));
		bg.setBg_dpcode((String)pu.getAttribute("userDp"));
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	
      //암호화 -> 복호화 system으로 확인 필수
      try {
         bg.setBg_budget(enc.aesDecode(dao.getBudgetList(bg).getBg_budget(),"mrone"));
         //수정해야함
      } catch (Exception e) {
         e.printStackTrace();
      } 
      return bg;
   }

}