package intranet.teamone.bean;

import lombok.Data;

@Data
public class AccessHistoryBean {
	private String ah_epcode;//id
	private String ah_publicip;
	private String ah_privateip;
	private String ah_browser;
	private String ah_method;
	private String ah_date;
	private String ah_pwd;
	private String ck;
}
