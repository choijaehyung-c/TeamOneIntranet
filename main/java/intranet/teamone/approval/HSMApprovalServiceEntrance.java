package intranet.teamone.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.ProductBean;

@Service
public class HSMApprovalServiceEntrance {
	
	@Autowired
	HSMApprovalServiceCtl asc;

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return asc.getApprovalList(ab);
	}

	

}
