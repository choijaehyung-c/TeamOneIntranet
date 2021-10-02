package intranet.teamone.order_manage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.DeliveryBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.MroneOrderDetailBean;
import intranet.teamone.bean.connectionBean;

@Service
public class OrderManageServiceEntrance {
	@Autowired
	OrderManageServiceCtl omc;
	public List<String> getAlreadyAsPrcode(String os_code){
		return omc.getAlreadyAsPrcode(os_code);
	}
	
	public List<MroneOrderBean> getOrderList() throws Exception{
		return omc.getOrderList("O");
	}
	
	public List<MroneOrderBean> getRefundList() throws Exception{
		return omc.getOrderList("R");
	}

	public List<MroneOrderBean> getExchangeList() throws Exception{
		return omc.getOrderList("E");
	}
	
	public List<MroneOrderBean> getOrderCompleteList() throws Exception{
		return omc.getOrderList("OC");
	}
	
	public List<MroneOrderBean> getRefundCompleteList() throws Exception{
		return omc.getOrderList("RC");
	}
	
	public List<MroneOrderBean> getExchangeCompleteList() throws Exception{
		return omc.getOrderList("EC");
	}
	
	public List<MroneOrderDetailBean> getOrderDetail(String os_code){
		return omc.getOrderDetail(os_code);
	}
	
	public DeliveryBean getDelivery(String os_code) {
		return omc.getDelivery(os_code);
	}
	
	public String connectOs(connectionBean cb){
		return omc.connectOs(cb);
	}
}
