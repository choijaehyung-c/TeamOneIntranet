package intranet.teamone.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.ApprovalBean;
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


	public List<ProductBean> getApprovalDetail(ApprovalBean ab) {
		
		return sql2.selectList("getApprovalDetail", ab);
	}


	public List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {
		
		return null;
	}
	
	public Boolean responseAppovalRefuse(ApprovalBean ab) {
		
		return convertToBoolean(sql2.update("responseAppovalRefuse", ab));
	}
	
	boolean convertToBoolean(int data) {
		return data > 0 ? true : false;
	}


	public List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getSendApprovalList", ab);
	}



	

}
