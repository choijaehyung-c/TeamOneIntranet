package intranet.teamone.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.OrderBean;

@Service
public class NSBApprovalServiceEntrance {
   @Autowired
   NSBApprovalServiceCtl asc;

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
}