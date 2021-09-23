package intranet.teamone.purchase;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.ProductBean;

@Repository
public class PurchaseDAO {
	
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;

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

}
