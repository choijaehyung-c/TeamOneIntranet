package intranet.teamone.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;


@Repository
public class HSMApprovalDAO {
	
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql2;

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getApprovalList", ab);
	}


	public List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {
		
		return sql2.selectList("getApprovalDetail", ab);
	}


	public List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getAnyApprovalList", ab);
	}
	
	public Boolean responseAppovalRefuse(ApprovalBean ab) {
		
		return convertToBoolean(sql2.update("responseAppovalRefuse", ab));
	}
	
	public List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getSendApprovalList", ab);
	}
	
	
	public Boolean insAA(IntranetOrderBean iob) {
		
		return convertToBoolean(sql2.insert("insAA", iob));
	}
	
	public Boolean updateAP(IntranetOrderBean iob) {
		
		return convertToBoolean(sql2.update("updateAP", iob));
	}

	public int totalPrice(IntranetOrderBean iob) {
	
		return sql2.selectOne("totalPrice", iob);
	}
	
	
	public String getBudget(IntranetOrderBean iob) {
		
		return sql2.selectOne("getBudget", iob);
	}
	
	
	public Boolean updateBudget(IntranetOrderBean iob) {
		
		return convertToBoolean(sql2.update("updateBudget", iob));
	}
	
	
	public Boolean insRL(MroneOrderBean mob) {
	
		return convertToBoolean(sql2.insert("insRL", mob));
	}
	
	boolean convertToBoolean(int data) {
		return data > 0 ? true : false;
	}


	public List<OrderDetailBean> getAnyApprovalDetail(ApprovalBean ab) {
		
		return sql2.selectList("getAnyApprovalDetail", ab);
	}


	public boolean responseAnyAppoval(ApprovalBean ab) {
		
		return convertToBoolean(sql2.update("responseAnyAppoval", ab));
	}


	public List<ApprovalBean> getSendAnyApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getSendAnyApprovalList", ab);
	}











	

}
