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
   
   BudgetBean bg;

   BudgetBean getBudgetList(){
      String ofCode = "SEO01B";
      bg = dao.getBudgetList(ofCode);
      //암호화 -> 복호화 system으로 확인 필수
      
      try {
         bg.setBg_budget(enc.aesDecode(dao.getBudgetList(ofCode).getBg_budget(),"SEO01B"));
         System.out.println("복호화 : "+bg.getBg_budget());
      } catch (Exception e) {
         e.printStackTrace();
      } 
      return bg;
   }

}