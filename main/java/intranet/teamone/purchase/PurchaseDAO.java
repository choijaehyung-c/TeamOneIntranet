package intranet.teamone.purchase;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.AccessInfoBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.ProductBean;

@Repository
public class PurchaseDAO {
	
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql2;

	 List<ProductBean> getBkind() {
		
		return sql.selectList("getBkind");
	}

	List<ProductBean> getCateName(String code) {
		
		return sql.selectList("getCateName", code);
	}

	 List<ProductBean> getCateItem(String cate) {
		
		return sql.selectList("getCateItem",cate);
	}

	ProductBean getPrDetail(ProductBean pr) {
		
		return sql.selectOne("getPrDetail",pr);
	}

	 List<ProductBean> getSearchItem(String word) {
		// TODO Auto-generated method stub
		return sql.selectList("getSearchItem", word);
	}
	 //해당 부서의 많이 구매한 상품 탑 5
	List<OrderBean> getRanking(AccessInfoBean ai){
		//System.out.println("Dao : "+ab);
		return sql2.selectList("getRank", ai);
	}


	 String getPrname(String prcode) {
 
			return sql.selectOne("getPrname",prcode);
	}

}
