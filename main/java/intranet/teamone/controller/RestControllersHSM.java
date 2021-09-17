package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.approval.HSMApprovalServiceEntrance;
import intranet.teamone.bean.ApprovalBean;



@RestController
@RequestMapping("/rest")
public class RestControllersHSM {
	
	@Autowired
	HSMApprovalServiceEntrance ase;

	@PostMapping("/GetApprovalList")
	public List<ApprovalBean> getApprovalList(@RequestBody ApprovalBean ab){
		return ase.getApprovalList(ab);
	}
	
	
}
