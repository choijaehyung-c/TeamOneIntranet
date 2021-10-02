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
      String ofCode =null ;
	try {
		ofCode = (String)pu.getAttribute("userOf");
	} catch (Exception e1) {
		e1.printStackTrace();
	}
	BudgetBean bg = new BudgetBean();
      //암호화 -> 복호화 system으로 확인 필수
      
      try {
         bg.setBg_budget(enc.aesDecode(dao.getBudgetList(ofCode).getBg_budget(),"SEO01B"));
         //수정해야함
         System.out.println("복호화 : "+bg.getBg_budget());
      } catch (Exception e) {
         e.printStackTrace();
      } 
      return bg;
   }

}