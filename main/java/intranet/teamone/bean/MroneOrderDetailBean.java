package intranet.teamone.bean;

import lombok.Data;

@Data
public class MroneOrderDetailBean {
	private String od_prspcode;
	private String os_origin;
	private String od_prcode;
	private String od_quantity;
	private String od_stcode;
	private String pr_name;
	private String pr_image;
	private int pr_price;
	private int pr_tax;
	private String pr_info;
	private String pr_origin; 
}
