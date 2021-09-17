package intranet.teamone.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.ApprovalBean;


@Repository
public class HSMApprovalDAO {
	
	@Autowired
	@Qualifier("mroneDB")
	SqlSessionTemplate sql;
	
	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql2;

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {
		
		return sql2.selectList("getApprovalList", ab);
	}

	

}
