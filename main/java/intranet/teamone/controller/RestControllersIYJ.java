package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.account.AccountancyServiceEntrance;
import intranet.teamone.approval.ApprovalServiceEntrance;
import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.BudgetBean;
import intranet.teamone.bean.DeliveryBean;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.MroneOrderDetailBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.bean.TaxBean;
import intranet.teamone.bean.connectionBean;
import intranet.teamone.order_manage.OrderManageServiceEntrance;
import intranet.teamone.purchase.PurchaseServiceEntrance;

@RestController
@RequestMapping("/rest")
public class RestControllersIYJ {
	
	@Autowired
	PurchaseServiceEntrance pse;
	
	@Autowired
	ApprovalServiceEntrance ase;
	
	@Autowired
	AccountancyServiceEntrance jae;
	
	@Autowired
	OrderManageServiceEntrance ome;

	@PostMapping ("/getSearchItem")
	public List<ProductBean> getSearchItem(@RequestBody String word){
		return pse.getSearchItem(word);
	}
	
	@PostMapping("/getPrDetail")
	public ProductBean getPrDetail(@RequestBody ProductBean pr) {
		//System.out.println("상품상세정보 : "+pse.getPrDetail(pr));
		return pse.getPrDetail(pr);
	}
	
	
	@PostMapping("/getRanking")
	public List<OrderBean> getRanking(){
		//System.out.println(pse.getRanking(ab));
		return pse.getRanking();
	}
	
	   @PostMapping("/GetApprovalList")
	   public List<ApprovalBean> getApprovalList() {
	      return ase.getApprovalList();
	   }

	   @PostMapping("/GetAnyApprovalList")
	   public List<ApprovalBean> getAnyApprovalList() {
	      return ase.getAnyApprovalList();
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
	   public List<ApprovalBean> getSendApprovalList() {
	      return ase.getSendApprovalList();
	   }

	   @PostMapping("/GetSendAnyApprovalList")
	   public List<ApprovalBean> getSendAnyApprovalList() {
	      return ase.getSendAnyApprovalList();
	   }

	@PostMapping("/ResponseAppovalAccept")
	public String responseAppovalAccept(@RequestBody IntranetOrderBean iob) {
		return ase.responseAppovalAccept(iob);
	}
	
	///////////////////////////nsb///////////////////

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
		
		 @PostMapping("/issueApproval")
		  public String issueApproval(@RequestBody ApprovalBean ab) {  
			
		     return ase.issueApproval(ab);         
		   }
		 
		 @PostMapping("/issueApproval2")
		  public String issueApproval2(@RequestBody ApprovalBean ab) {      
		     return ase.issueApproval2(ab);         
		   }

	//////////////////////jes////////////////////////////
		@PostMapping("/getBudgetList") //확인했는데 못알아먹을때 앞에 다 문자열도 붙이기
		   public BudgetBean getBudgetList(){
		      
		      return jae.getBudgetList();
		   }   
		
	////////////////////////////cjh///////////////////////////////
		
		@PostMapping("/getOrderList")
		public List<MroneOrderBean> getOrderList() throws Exception{
			return ome.getOrderList();
		}
		
		@PostMapping("/getRefundList")
		public List<MroneOrderBean> getRefundList() throws Exception{
			return ome.getRefundList();
		}

		@PostMapping("/getExchangeList")
		public List<MroneOrderBean> getExchangeList() throws Exception{
			return ome.getExchangeList();
		}
		
		@PostMapping("/getOrderCompleteList")
		public List<MroneOrderBean> getOrderCompleteList() throws Exception{
			return ome.getOrderCompleteList();
		}
		
		@PostMapping("/getRefundCompleteList")
		public List<MroneOrderBean> getRefundCompleteList() throws Exception{
			return ome.getRefundCompleteList();
		}
		
		@PostMapping("/getExchangeCompleteList")
		public List<MroneOrderBean> getExchangeCompleteList() throws Exception{
			return ome.getExchangeCompleteList();
		}
		
		@PostMapping("/getOrderDetail")
		public List<MroneOrderDetailBean> getOrderDetail(@RequestBody String os_code){
			return ome.getOrderDetail(os_code);
		}
		
		@PostMapping("/getDelivery")
		public DeliveryBean getDelivery(@RequestBody String os_code){
			return ome.getDelivery(os_code);
		}
		
		@PostMapping("/osConnect")
		public String connectOs(@RequestBody connectionBean cb) {
			return ome.connectOs(cb);
		}
		
		@PostMapping("/getAlreadyAsPrcode")
		public List<String> getAlreadyAsPrcode(@RequestBody String os_code){
			return ome.getAlreadyAsPrcode(os_code);
		}
}
