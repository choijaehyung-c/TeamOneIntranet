package intranet.teamone.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.TaxBean;

@Repository
public class NSBApprovalDAO {
   @Autowired
   @Qualifier("mroneDB")
   SqlSessionTemplate sql;
   
   @Autowired
   @Qualifier("intranetDB")
   SqlSessionTemplate sql2;

   public EmployeeBean getDrafter(String epcode) {      
      return sql2.selectOne("getDrafter", epcode);
   }
   
   public List<EmployeeBean> getDP() {      
      return sql2.selectList("getDP");
   }
   
   public EmployeeBean inputDP(String epcode) {      
      return sql2.selectOne("inputDP", epcode);
   }

   public List<OrderBean> getApprovalOrderList(String ofcode) {
      return sql.selectList("getApprovalOrderList", ofcode);
   }

   public OrderBean inputOrder(String oscode) {
      return sql.selectOne("inputOrder", oscode);
   }

   public List<TaxBean> getIssuedTax(String ofcode) {
	return sql.selectList("getIssuedTax", ofcode);
   }

public String getofcode(String epcode) {
	return sql2.selectOne("getofcode", epcode);
}

public TaxBean getIssuedTaxDetail(String tbcode) {
	return sql.selectOne("getIssuedTaxDetail", tbcode);
}

public List<OrderDetailBean> getTaxProduct(String oscode) {
	return sql.selectList("getTaxProduct", oscode);
}

}