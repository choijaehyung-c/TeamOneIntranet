package intranet.teamone.bean;

import java.util.List;

import lombok.Data;

@Data
public class IntranetOrderBean {
	private String rl_ioscode;
	private String aa_apcode;	
	private String ep_code;	
	private String of_code;	
	private String dp_code;	
	private String bg_budget;	
	private List<MroneOrderBean> mos;
}
