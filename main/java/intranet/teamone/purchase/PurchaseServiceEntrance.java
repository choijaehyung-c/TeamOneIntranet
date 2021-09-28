package intranet.teamone.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.ProductBean;

@Service
public class PurchaseServiceEntrance {
	
	@Autowired
	PurchaseServiceCtl psc;

	public List<ProductBean> getBkind() {
		
		return psc.getBkind();
	}

	public List<ProductBean> getCateName(String code) {
		
		return psc.getCateName(code);
	}

	public List<ProductBean> getCateItem(String cate) {
		
		return psc.getCateItem(cate);
	}

	public ProductBean getPrDetail(ProductBean pr) {
		
		return psc.getPrDetail(pr);
	}
	
	public List<ProductBean> getSearchItem(String word) {
		
		return psc.getSearchItem(word);
	}

	 //해당 부서의 많이 구매한 상품 탑 5
	public List<OrderBean> getRanking(){
		//System.out.println("입구 :  "+psc.getRanking(ab));
		return psc.getRanking();
	}

}
