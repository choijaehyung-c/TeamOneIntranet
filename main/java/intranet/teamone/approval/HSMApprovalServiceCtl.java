package intranet.teamone.approval;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.ProductBean;


@Service
public class HSMApprovalServiceCtl {
	
	@Autowired
	HSMApprovalDAO dao;

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return dao.getApprovalList(ab);
	}


	public List<ProductBean> getApprovalDetail(ApprovalBean ab) {
		
		return dao.getApprovalDetail(ab);
	}


	public List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {
		
		return dao.getAnyApprovalList(ab);
	}


	public String responseAppovalRefuse(ApprovalBean ab) {
		String msg = null;
		if(dao.responseAppovalRefuse(ab)){
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}


	public List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {
		
		return dao.getSendApprovalList(ab);
	}


}
