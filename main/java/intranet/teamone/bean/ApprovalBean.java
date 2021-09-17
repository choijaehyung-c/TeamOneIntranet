package intranet.teamone.bean;

import lombok.Data;

@Data
public class ApprovalBean {
	private String ap_code;
	private String ap_oscode;
	private String ap_fromdpcode;
	private String ap_fromofcode;
	private String ap_todpcode;
	private String ap_toofcode;
	private String ap_date;
	private String ap_cgtype;
	private String cg_name;
	private String dp_name;
}
