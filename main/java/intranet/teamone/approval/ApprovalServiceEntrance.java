package intranet.teamone.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.bean.TaxBean;

@Service
public class ApprovalServiceEntrance {

	@Autowired
	ApprovalServiceCtl asc;

	//받은 결재리스트 불러오기
	public List<ApprovalBean> getApprovalList() {

		return asc.getApprovalList();
	}
	
	public List<ApprovalBean> getApprovalList2() {

		return asc.getApprovalList2();
	}

	//해당 os코드의 주문디테일 가져오기
	public List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {

		return asc.getApprovalDetail(ab);
	}

	public List<ApprovalBean> getAnyApprovalList() {

		return asc.getAnyApprovalList();
	}
	public List<ApprovalBean> getAnyApprovalList2() {
		return asc.getAnyApprovalList2();
	}

	public String responseAppovalRefuse(ApprovalBean ab) {

		return asc.responseAppovalRefuse(ab);
	}

	public List<ApprovalBean> getSendApprovalList() {

		return asc.getSendApprovalList();
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

	public List<ApprovalBean> getSendAnyApprovalList() {

		return asc.getSendAnyApprovalList();
	}

	public EmployeeBean getDrafter() {   
		return asc.getDrafterCtl();
	}

	public List<EmployeeBean> getDP() {   
		return asc.getDPCtl();
	}

	public EmployeeBean inputDP(String epcode) {   
		return asc.inputDPCtl(epcode);
	}

	public List<OrderBean> getApprovalOrderList(String ofcode) {
		return asc.getApprovalOrderList(ofcode);
	}

	public OrderBean inputOrder(String oscode) {   
		return asc.inputOrder(oscode);
	}

	public List<TaxBean> getIssuedTax() {
		return asc.getIssuedTaxCtl();
	}

	public TaxBean getIssuedTaxDetail(String tbcode) {
		return asc.getIssuedTaxDetailCtl(tbcode);
	}

	public String issueApproval(ApprovalBean ab) {
		   return asc.issueApprovalCtl(ab);
		}
	
	public String issueApproval2(ApprovalBean ab) {
		
		   return asc.issueApprovalCtl2(ab);
		}



}
