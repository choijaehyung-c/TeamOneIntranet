package intranet.teamone.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.Bkind;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.ProductBean;
import intranet.teamone.utils.ProjectUtils;

@Service
public class PurchaseServiceCtl {
	
	@Autowired
	PurchaseDAO dao;
	
	@Autowired
	ProjectUtils pu;

	List<ProductBean> getBkind() {
		List<ProductBean> list = dao.getBkind();
			for(int i=0; i<list.size(); i++) {
				list.get(i).setCate_name(this.getCateName(list.get(i).getBk_code()));
				//System.out.println(list.get(i));
			}
		
		return list;
	}

	List<Bkind> getCateName(String code) {
	
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
	List<OrderBean> getRanking(){
		//세션으로 지사, 부서 정보 set
		AccessInfoBean ai = new AccessInfoBean();
		try {
			ai.setDp_code((String)pu.getAttribute("userDp"));
			ai.setOf_code((String)pu.getAttribute("userOf"));
		} catch (Exception e) {e.printStackTrace();}
		
		//return된 데이터
		List<OrderBean> list = dao.getRanking(ai);
		for(int i=0; i<list.size();i++) {
			 list.get(i).setPr_name(this.getPrname(list.get(i).getOd_prcode()));	
		}
		
		int lcount = list.size();
		if(lcount < 5) {
			for(int i=0 ; i < 5-lcount ; i++) {
				OrderBean ob = new OrderBean();
				ob.setPr_name("구매내역없음");
				ob.setOd_quantity(0);
				list.add(ob);
			}
		}
		
		return list;
	}
	
	
	//상품코드로 상품이름을 가져오는 메서드
	String getPrname(String prcode){
		return dao.getPrname(prcode);
	}
	
	
}
