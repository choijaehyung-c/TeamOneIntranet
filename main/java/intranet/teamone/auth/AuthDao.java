package intranet.teamone.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import intranet.teamone.bean.AccessBean;
import intranet.teamone.bean.AccessHistoryBean;


@Repository
public class AuthDao {

	@Autowired
	@Qualifier("intranetDB")
	SqlSessionTemplate sql;
	
	// 해당 아이디 단일 로그인 체크
	boolean getAccessHistorySum(AccessHistoryBean ah){
		return convertToBoolean(sql.selectOne("getAccessHistorySum",ah));
	}

	// 해당 아이디 아이피 브라우저 로그아웃전 체크
	boolean getLogOutAccessHistorySum(AccessHistoryBean ah){
		return convertToBoolean(sql.selectOne("getLogOutAccessHistorySum",ah));
	}
	
	String getLastAccessInfo(AccessHistoryBean ah) {
		return sql.selectOne("getLastAccessInfo",ah);
	}
	
	boolean isUserId(AccessBean ab) {
		return convertToBoolean(sql.selectOne("isUserId", ab));
	}

	boolean checkPwd(AccessBean ab) {
		return convertToBoolean(sql.selectOne("checkPwd", ab));
	}
	
	
	boolean forceLogout(AccessHistoryBean ah) {
		return convertToBoolean(sql.insert("forceLogout", ah));
	}
	
	boolean insAccessHistory(AccessHistoryBean ah) {
		return convertToBoolean(sql.insert("insAccessHistoryIntranet", ah));
	}
	
	private boolean convertToBoolean(int data) {
		return data>0? true : false;
	}

	
	
	
}
