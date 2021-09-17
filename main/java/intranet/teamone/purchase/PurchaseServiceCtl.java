package intranet.teamone.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
