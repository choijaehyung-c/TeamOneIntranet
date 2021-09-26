package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.approval.NSBApprovalServiceEntrance;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.TaxBean;



@RestController
@RequestMapping("/")
public class RestControllersNSB {
   
   @Autowired
   NSBApprovalServiceEntrance ase;

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