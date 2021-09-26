package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.bean.DeliveryBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.MroneOrderDetailBean;
import intranet.teamone.bean.connectionBean;
import intranet.teamone.order_manage.OrderManageServiceEntrance;

@RestController
@RequestMapping("/rest")
public class RestControllersCJH {
	/*
	 * @GetMapping("/getOrderList") public List<>
	 * 
	 */
	@Autowired
	OrderManageServiceEntrance ome;

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
	
}
