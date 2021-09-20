package intranet.teamone.order_manage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class OrderManageDAO {
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate mSql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate iSql;
	
	

}
