package intranet.teamone.account;

import org.springframework.beans.factory.annotation.Qualifier;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.BudgetBean;

@Repository
public class AccountancyServiceDao {
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql2;

   //암호화 된 부분 가져오기
   public BudgetBean getBudgetList(String ofcode){
      return sql2.selectOne("getBudgetList", ofcode);
   }


}