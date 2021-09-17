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
@RequestMapping("/rest")
public class RestControllers {
	
	@Autowired
	PurchaseServiceEntrance pse;

	@PostMapping("/SearchItem")
	public List<ProductBean> SearchItem(String word){
		return null;
	}
	
	@PostMapping("/getBkind")
	public List<ProductBean> getBkind(){
		//System.out.println(pse.getBkind());
		return pse.getBkind();
	}
	
	@PostMapping("/GetCateName")
	public List<ProductBean> GetCateName(@RequestBody String code){
		System.out.println(pse.getCateName(code));
		return pse.getCateName(code);
	}
	
	@PostMapping("/GetCateItem")
	public List<ProductBean> GetCateItem(@RequestBody String cate){
		System.out.println(pse.getCateItem(cate));
		return pse.getCateItem(cate);
	}
	
}
