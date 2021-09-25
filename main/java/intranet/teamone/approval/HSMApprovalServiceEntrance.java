package intranet.teamone.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;

@Service
public class HSMApprovalServiceEntrance {
	
	@Autowired
	HSMApprovalServiceCtl asc;

	//받은 결재리스트 불러오기
	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return asc.getApprovalList(ab);
	}
	
	//해당 os코드의 주문디테일 가져오기
	public List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {
		
		return asc.getApprovalDetail(ab);
	}

	public List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {
		
		return asc.getAnyApprovalList(ab);
	}

	public String responseAppovalRefuse(ApprovalBean ab) {
		
		return asc.responseAppovalRefuse(ab);
	}

	public List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {
		
		return asc.getSendApprovalList(ab);
	}

	public String responseAppovalAccept(IntranetOrderBean iob) {
		
		return asc.IntranetOrderBean(iob);
	}

	public List<OrderDetailBean> getAnyApprovalDetail(ApprovalBean ab) {
		
		return asc.getAnyApprovalDetail(ab);
	}

	public String responseAnyAppoval(ApprovalBean ab) {
		
		return asc.responseAnyAppoval(ab);
	}

	public List<ApprovalBean> getSendAnyApprovalList(ApprovalBean ab) {
		
		return asc.getSendAnyApprovalList(ab);
	}

	

}
