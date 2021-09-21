package intranet.teamone.order_manage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.utils.ProjectUtils;

@Service
public class OrderManageServiceCtl {
	
	@Autowired
	ProjectUtils pu;
	
	@Autowired
	OrderManageDAO dao;
	
	List<MroneOrderBean> getOrderList(String type) throws Exception {
		String os_region = "KOR001SEO01BMK";// 임시저장
		/*
		 * os_region=(String)pu.getAttribute("cp") + (String)pu.getAttribute("of") +
		 * (String)pu.getAttribute("dp");
		 */
		List<MroneOrderBean> mos = null;
		if(type.equals("o"))
		mos = dao.getOrderList(os_region);
		else if(type.equals("r"))
		mos = dao.getRefundList(os_region);
		else if(type.equals("e"))
		mos = dao.getExchangeList(os_region);
		
		int mosCount = mos.size();
		for (int i = 0; i < mosCount; i++) {
			mos.get(i).setIos(dao.getRelationOscode(mos.get(i)));
			List<String> od = dao.getPrnameAndCount(mos.get(i).getOs_code());
			if (od != null) {
				if (od.size() > 1) {
					mos.get(i).setOs_summary(od.get(0) + " 외 " + (od.size() - 1) + "건");
				} else {
					mos.get(i).setOs_summary(od.get(0) + od.size() + " 1건");
				}
			}
		}
		return mos;
	}
}
