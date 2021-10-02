package intranet.teamone.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.bean.TaxBean;


@Repository
public class ApprovalDAO {
	
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql2;

	
	String getOsRegion(String os_code) {
		return sql2.selectOne("getOsRegion",os_code);
	}
	
	String getOfDpName(ApprovalBean ab) {
		return sql2.selectOne("getOfDpName",ab);
	}
	
	List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		return sql2.selectList("getApprovalList", ab);
	}


	List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {
		return sql2.selectList("getApprovalDetail", ab);
	}

	String getPrname(String prcode) {
		return sql.selectOne("getPrname",prcode);
	}
	

	List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {
		return sql2.selectList("getAnyApprovalList", ab);
	}
	
	boolean responseAppovalRefuse(ApprovalBean ab) {
		return convertToBoolean(sql2.update("responseAppovalRefuse", ab));
	}
	
	List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {
		return sql2.selectList("getSendApprovalList", ab);
	}
	
	boolean insAA(IntranetOrderBean iob) {
		return convertToBoolean(sql2.insert("insAA", iob));
	}
	
	boolean updateAP(IntranetOrderBean iob) {
		
		return convertToBoolean(sql2.update("updateAP", iob));
	}

	int totalPrice(IntranetOrderBean iob) {
		return sql2.selectOne("totalPrice", iob);
	}
	
	String getBudget(IntranetOrderBean iob) {
		return sql2.selectOne("getBudget", iob);
	}
	
	boolean updateBudget(IntranetOrderBean iob) {
		return convertToBoolean(sql2.update("updateBudget", iob));
	}
	
	boolean insRL(MroneOrderBean mob) {
		return convertToBoolean(sql2.insert("insRL", mob));
	}
	
	boolean convertToBoolean(int data) {
		return data > 0 ? true : false;
	}

	List<OrderDetailBean> getAnyApprovalDetail(ApprovalBean ab) {
		return sql2.selectList("getAnyApprovalDetail", ab);
	}


	boolean responseAnyAppoval(ApprovalBean ab) {
		return convertToBoolean(sql2.update("responseAnyAppoval", ab));
	}


	List<ApprovalBean> getSendAnyApprovalList(ApprovalBean ab) {
		return sql2.selectList("getSendAnyApprovalList", ab);
	}

	EmployeeBean getDrafter(String epcode) {      
	      return sql2.selectOne("getDrafter", epcode);
	   }
	   
	   List<EmployeeBean> getDP() {      
	      return sql2.selectList("getDP");
	   }
	   
	   EmployeeBean inputDP(String epcode) {      
	      return sql2.selectOne("inputDP", epcode);
	   }

	   List<OrderBean> getApprovalOrderList(String ofcode) {
	      return sql.selectList("getApprovalOrderList", ofcode);
	   }

	   OrderBean inputOrder(String oscode) {
	      return sql.selectOne("inputOrder", oscode);
	   }

	   List<TaxBean> getIssuedTax(String ofcode) {
		return sql.selectList("getIssuedTax", ofcode);
	   }

	String getofcode(String epcode) {
		return sql2.selectOne("getofcode", epcode);
	}

	TaxBean getIssuedTaxDetail(String tbcode) {
		return sql.selectOne("getIssuedTaxDetail", tbcode);
	}

	List<OrderDetailBean> getTaxProduct(String oscode) {
		return sql.selectList("getTaxProduct", oscode);
	}


	boolean issueApproval(ApprovalBean ab) {   
		   return convertToBoolean(sql2.insert("issueApproval", ab));
		}

		boolean insOs(ApprovalBean ab) {   
		   return convertToBoolean(sql2.insert("insOs", ab));
		}

		boolean insOd(ApprovalBean ab) {
		   return convertToBoolean(sql2.insert("insOd", ab));
		}

		String getoscode() {
		   return sql2.selectOne("getoscode");
		}


		boolean insAn(ApprovalBean ab) {
			return convertToBoolean(sql2.insert("insAn", ab));
		}



	

}
