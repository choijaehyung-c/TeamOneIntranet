package intranet.teamone.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.ProductBean;

@Service
public class PurchaseServiceCtl {
	
	@Autowired
	PurchaseDAO dao;

	List<ProductBean> getBkind() {

		return dao.getBkind();
	}

	List<ProductBean> getCateName(String code) {
	
		return dao.getCateName(code);
	}

	 List<ProductBean> getCateItem(String cate) {
		
		return dao.getCateItem(cate);
	}

	ProductBean getPrDetail(ProductBean pr) {
		
		return dao.getPrDetail(pr);
	}

	 List<ProductBean> getSearchItem(String word) {
	
		 
		return dao.getSearchItem(word);
	}

	 //해당 부서의 많이 구매한 상품 탑 5
	List<OrderBean> getRanking(AccessInfoBean ab){
		
		List<OrderBean> list;
		list = dao.getRanking(ab);
		for(int i=0; i<list.size();i++) {
			System.out.println(this.getPrname(list));
		}
		
		return dao.getRanking(ab);
	}
	
	List<OrderBean> getPrname(List<OrderBean> orderBean){
		
		for(int i=0; i<orderBean.size(); i++) {
			 dao.getPrname(orderBean.get(i));
		}
		
		return orderBean;
	}
	
	
}
