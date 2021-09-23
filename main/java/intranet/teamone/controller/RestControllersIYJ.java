package intranet.teamone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
}
