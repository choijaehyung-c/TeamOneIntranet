package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.approval.HSMApprovalServiceEntrance;
import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.bean.TaxBean;
import intranet.teamone.purchase.PurchaseServiceEntrance;

@RestController
@RequestMapping("/rest")
public class RestControllersIYJ {
	
	@Autowired
	PurchaseServiceEntrance pse;
	
	@Autowired
	HSMApprovalServiceEntrance ase;
	
	

	@PostMapping ("/getSearchItem")
	public List<ProductBean> getSearchItem(@RequestBody String word){
		return pse.getSearchItem(word);
	}
	
	@PostMapping("/getPrDetail")
	public ProductBean getPrDetail(@RequestBody ProductBean pr) {
		System.out.println("상품상세정보 : "+pse.getPrDetail(pr));
		return pse.getPrDetail(pr);
	}
	
	//아직 구현중
	@PostMapping("/getRanking")
	public List<OrderBean> getRanking(@RequestBody AccessInfoBean ab){
		System.out.println(pse.getRanking(ab));
		return pse.getRanking(ab);
	}
	
	@PostMapping("/GetApprovalList")
	public List<ApprovalBean> getApprovalList(@RequestBody ApprovalBean ab) {
		return ase.getApprovalList(ab);
	}

	@PostMapping("/GetAnyApprovalList")
	public List<ApprovalBean> getAnyApprovalList(@RequestBody ApprovalBean ab) {
		return ase.getAnyApprovalList(ab);
	}

	@PostMapping("/GetApprovalDetail")
	public List<OrderDetailBean> getApprovalDetail(@RequestBody ApprovalBean ab) {
		return ase.getApprovalDetail(ab);
	}
	@PostMapping("/GetAnyApprovalDetail")
	public List<OrderDetailBean> getAnyApprovalDetail(@RequestBody ApprovalBean ab) {
		return ase.getAnyApprovalDetail(ab);
	}
	
	@PostMapping("/ResponseAppovalRefuse")
	public String responseAppovalRefuse(@RequestBody ApprovalBean ab) {
		return ase.responseAppovalRefuse(ab);
	}
	@PostMapping("/ResponseAnyAppoval")
	public String responseAnyAppoval(@RequestBody ApprovalBean ab) {
		return ase.responseAnyAppoval(ab);
	}
	
	@PostMapping("/GetSendApprovalList")
	public List<ApprovalBean> getSendApprovalList(@RequestBody ApprovalBean ab) {
		return ase.getSendApprovalList(ab);
	}

	@PostMapping("/GetSendAnyApprovalList")
	public List<ApprovalBean> getSendAnyApprovalList(@RequestBody ApprovalBean ab) {
		return ase.getSendAnyApprovalList(ab);
	}

	@PostMapping("/ResponseAppovalAccept")
	public String responseAppovalAccept(@RequestBody IntranetOrderBean iob) {
		return ase.responseAppovalAccept(iob);
	}
	
	///////nsb///////////////////

	   @PostMapping("/getDrafter")
	   public EmployeeBean getDrafter() {   
	      return ase.getDrafter();   
	   }
	   
	   @PostMapping("/getDP")
	   public List<EmployeeBean> getDP() {   
	      return ase.getDP();   
	   }
	   
	   @PostMapping("/inputDP")
	   public EmployeeBean inputDP(@RequestBody String epcode) {   
	      return ase.inputDP(epcode);   
	   }
	   
	   @PostMapping("/getApprovalOrderList")
	   public List<OrderBean> getApprovalOrderList(@RequestBody String ofcode) {   
	      System.out.println(ofcode);
	      return ase.getApprovalOrderList(ofcode);   
	   }
	   
	   @PostMapping("/inputOrder")
	   public OrderBean inputOrder(@RequestBody String oscode) {   
	      System.out.println(ase.inputOrder(oscode));
	      return ase.inputOrder(oscode);   
	   }
	   
		@PostMapping("/getIssuedTax")
		public List<TaxBean> getIssuedTax() {		
			return ase.getIssuedTax();			
		}
		
		@PostMapping("/getIssuedTaxDetail")
		public TaxBean getIssuedTaxDetail(@RequestBody String tbcode) {		
			return ase.getIssuedTaxDetail(tbcode);			
		}

	
}
