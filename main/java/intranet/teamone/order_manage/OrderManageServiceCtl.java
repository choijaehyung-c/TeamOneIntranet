package intranet.teamone.order_manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.AsBean;
import intranet.teamone.bean.DeliveryBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.MroneOrderDetailBean;
import intranet.teamone.bean.connectionBean;
import intranet.teamone.utils.ProjectUtils;

@Service
public class OrderManageServiceCtl {
	
	@Autowired
	ProjectUtils pu;
	
	@Autowired
	OrderManageDAO dao;
	
	List<MroneOrderBean> getOrderList(String type) throws Exception {
		String os_region = (String)pu.getAttribute("userCp")+(String)pu.getAttribute("userOf")+(String)pu.getAttribute("userDp");
		/*
		 * os_region=(String)pu.getAttribute("cp") + (String)pu.getAttribute("of") +
		 * (String)pu.getAttribute("dp");
		 */
		
		System.out.println(os_region);
		List<MroneOrderBean> mos = null;
		if(type.equals("O")) {
			mos = dao.getOrderList(os_region);
			List<String>ASList = dao.getASList(os_region);
			int mCount = mos.size();
				for(int i = mCount-1 ; i >= 0 ; i--) {
					if(ASList.contains(mos.get(i).getOs_code())) {
						mos.remove(i);
					}
				}
		}
		else if(type.equals("OC"))
			mos = dao.getOrderCompleteList(os_region);
		else if(type.equals("R"))
			mos = dao.getRefundList(os_region);
		else if(type.equals("E"))
			mos = dao.getExchangeList(os_region);
		else if(type.equals("EC"))
			mos = dao.getExchangeCompleteList(os_region);
		else if(type.equals("RC"))
			mos = dao.getRefundCompleteList(os_region);
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("OC", "주문완료");
		map.put("OF", "주문거절");
		map.put("OR", "주문접수중");
		map.put("OA", "주문수락");
		
		map.put("RC", "반품완료");
		map.put("FF", "반품거절");
		map.put("RR", "반품접수중");
		map.put("RA", "반품수락");
		
		map.put("EC", "교환완료");
		map.put("EF", "교환거절");
		map.put("ER", "교환접수중");
		map.put("EA", "교환수락");
		
		
		int mosCount = mos.size();
		for (int i = 0; i < mosCount; i++) {
			mos.get(i).setIos(dao.getRelationOscode(mos.get(i)));
			mos.get(i).setOs_stname(map.get(mos.get(i).getOs_state()));
			List<String> od = dao.getPrnameAndCount(mos.get(i).getOs_code());
			if (!od.isEmpty()) {
				mos.get(i).setSearch(od.toString());
				if (od.size() > 1) {
					mos.get(i).setOs_summary(od.get(0) + " 외 " + (od.size() - 1) + "건");
				} else {
					mos.get(i).setOs_summary(od.get(0) + od.size() + " 1건");
				}
			}else {
				mos.get(i).setOs_summary("od없");
			}
		}
		return mos;
	}
	
	String connectOs(connectionBean cb) {
		String os_region = "";
		try {
			 os_region = (String)pu.getAttribute("userCp")+(String)pu.getAttribute("userOf")+(String)pu.getAttribute("userDp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cb.getIos()==null) {
			cb.setIos("99999999999");
		}
		cb.setRegion(os_region);
		return dao.connectOs(cb)?"successs":"failed";
	}
	
	List<MroneOrderDetailBean> getOrderDetail(String os_code){
		/*
		 * List<String> as = dao.getAlreadyAsPrcode(os_code);
		 * System.out.println(os_code+":::"+as);
		 */
		List<MroneOrderDetailBean> list = dao.getOrderDetail(os_code);
		/*
		 * int listSize = list.size(); for(int i = 0 ; i < listSize ; i++) {
		 * if(as.contains(list.get(i).getOd_prcode())) {
		 * System.out.println("testsetsetsetset"); } }
		 */
		
		return list;
	}
	
	DeliveryBean getDelivery(String os_code) {
		DeliveryBean dl = new DeliveryBean();
		dl = dao.getDelivery(os_code);
		if(dl==null)dl = dao.getDeliveryAS(os_code);
		dl.setLc(dao.getDeliveryLocation(dl.getDl_lccode()));
		return dl;
	}
	
}
