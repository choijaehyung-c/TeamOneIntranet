package intranet.teamone.bean;

import java.util.List;

import lombok.Data;

@Data
public class DeliveryBean {
	private String dl_code;
	private String dl_oscode;
	private int dl_dscode;
	private String dl_lccode;
	private String dv_name;
	private String dv_hp;
	private List<DeliveryLocationBean> lc;
}
