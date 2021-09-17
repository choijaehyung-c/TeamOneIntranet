package intranet.teamone.approval;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.ApprovalBean;


@Service
public class HSMApprovalServiceCtl {
	
	@Autowired
	HSMApprovalDAO dao;

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return dao.getApprovalList(ab);
	}


}
