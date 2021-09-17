package intranet.teamone.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
