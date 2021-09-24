package intranet.teamone.bean;

import lombok.Data;

@Data
public class AccessInfoBean {
	private String cp_code; //회사
	private String of_code; //지사
	private String dp_code; //부서
	private String ep_code; //사원
	private String cp_name;
	private String of_name;
	private String dp_name;
	private String ep_name;
}
