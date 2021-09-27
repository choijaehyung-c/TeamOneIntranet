//package intranet.teamone.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import intranet.teamone.approval.HSMApprovalServiceEntrance;
//import intranet.teamone.bean.ApprovalBean;
//import intranet.teamone.bean.IntranetOrderBean;
//import intranet.teamone.bean.OrderDetailBean;
//import intranet.teamone.bean.ProductBean;
//
//@RestController
//@RequestMapping("/rest")
//public class RestControllersHSM {
//
//	@Autowired
//	HSMApprovalServiceEntrance ase;
//
//	@PostMapping("/GetApprovalList")
//	public List<ApprovalBean> getApprovalList(@RequestBody ApprovalBean ab) {
//		return ase.getApprovalList(ab);
//	}
//
//	@PostMapping("/GetAnyApprovalList")
//	public List<ApprovalBean> getAnyApprovalList(@RequestBody ApprovalBean ab) {
//		return ase.getAnyApprovalList(ab);
//	}
//
//	@PostMapping("/GetApprovalDetail")
//	public List<OrderDetailBean> getApprovalDetail(@RequestBody ApprovalBean ab) {
//		return ase.getApprovalDetail(ab);
//	}
//	@PostMapping("/GetAnyApprovalDetail")
//	public List<OrderDetailBean> getAnyApprovalDetail(@RequestBody ApprovalBean ab) {
//		return ase.getAnyApprovalDetail(ab);
//	}
//	
//	@PostMapping("/ResponseAppovalRefuse")
//	public String responseAppovalRefuse(@RequestBody ApprovalBean ab) {
//		return ase.responseAppovalRefuse(ab);
//	}
//	@PostMapping("/ResponseAnyAppoval")
//	public String responseAnyAppoval(@RequestBody ApprovalBean ab) {
//		return ase.responseAnyAppoval(ab);
//	}
//	
//	@PostMapping("/GetSendApprovalList")
//	public List<ApprovalBean> getSendApprovalList(@RequestBody ApprovalBean ab) {
//		return ase.getSendApprovalList(ab);
//	}
//
//	@PostMapping("/GetSendAnyApprovalList")
//	public List<ApprovalBean> getSendAnyApprovalList(@RequestBody ApprovalBean ab) {
//		return ase.getSendAnyApprovalList(ab);
//	}
//
//	@PostMapping("/ResponseAppovalAccept")
//	public String responseAppovalAccept(@RequestBody IntranetOrderBean iob) {
//		return ase.responseAppovalAccept(iob);
//	}
//}
