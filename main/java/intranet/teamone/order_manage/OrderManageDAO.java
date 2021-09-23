package intranet.teamone.order_manage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.DeliveryBean;
import intranet.teamone.bean.DeliveryLocationBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.MroneOrderDetailBean;

@Repository
public class OrderManageDAO {
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate mSql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate iSql;
	
	List<MroneOrderBean> getOrderList(String os_region){
		return mSql.selectList("getOrderList",os_region);
	}
	
	List<MroneOrderBean> getOrderCompleteList(String os_region){
		return mSql.selectList("getOrderCompleteList",os_region);
	}
	
	List<MroneOrderBean> getRefundList(String os_region){
		return mSql.selectList("getRefundList",os_region);
	}
	
	List<MroneOrderBean> getRefundCompleteList(String os_region){
		return mSql.selectList("getRefundCompleteList",os_region);
	}
	
	List<MroneOrderBean> getExchangeList(String os_region){
		return mSql.selectList("getExchangeList",os_region);
	}
	
	List<MroneOrderBean> getExchangeCompleteList(String os_region){
		return mSql.selectList("getExchangeCompleteList",os_region);
	}

	List<String> getPrnameAndCount(String os_code){
		return mSql.selectList("getPrnameAndCount",os_code);
	}
	
	String getRelationOscode(MroneOrderBean mo) {
		return iSql.selectOne("getRelationOscode",mo);
	}
	
	List<MroneOrderDetailBean> getOrderDetail(String os_code){
		return mSql.selectList("getOrderDetail",os_code);
	}
	
	DeliveryBean getDelivery(String os_code) {
		return mSql.selectOne("getDelivery",os_code);
	}
	
	List<DeliveryLocationBean> getDeliveryLocation(String lc_code) {
		return mSql.selectList("getDeliveryLocation",lc_code);
	}
	
}