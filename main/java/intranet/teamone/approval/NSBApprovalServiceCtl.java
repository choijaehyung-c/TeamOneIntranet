package intranet.teamone.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.utils.Encryption;
import intranet.teamone.utils.ProjectUtils;


@Service
public class NSBApprovalServiceCtl {
	@Autowired
	NSBApprovalDAO dao;
	@Autowired
	ProjectUtils pu;
	@Autowired
	Encryption enc;

	EmployeeBean getDrafterCtl() {
		
		String epcode = null;
		try {
			if(pu.getAttribute("userSs") != null) {
				epcode=enc.aesDecode((String)pu.getAttribute("userSs"),"session");
			}
		} catch (Exception e) {
						
			e.printStackTrace();
		}
		return dao.getDrafter(epcode);
	}
	
	List<EmployeeBean> getDPCtl() {
		return dao.getDP();
		
	}
	
	EmployeeBean inputDPCtl(String epcode) {
		return dao.inputDP(epcode);		
	}

	public List<OrderBean> getApprovalOrderList(String ofcode) {
		return dao.getApprovalOrderList(ofcode);
	}

	public OrderBean inputOrder(String oscode) {
		return dao.inputOrder(oscode);	
	}
}
