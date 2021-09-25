package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.purchase.PurchaseServiceEntrance;

@RestController
@RequestMapping("/restIYJ")
public class RestControllersIYJ {
	
	@Autowired
	PurchaseServiceEntrance pse;

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
	public List<OrderBean> getRanking(){
		return pse.getRanking();
	}
	
}
