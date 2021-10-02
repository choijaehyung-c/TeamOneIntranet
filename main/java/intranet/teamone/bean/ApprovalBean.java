package intranet.teamone.bean;

import java.util.List;

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
	   private String cg_name;
	   private String cg_type;
	   private String dp_name;
	   private String of_name;
	   private String of_code;
	   private String od_code;
	   private String at_code;
	   private String at_name;
	   private String an_text;
	   private List<CartBean> cart;
	   private String cp_code;
	   private String cp_name;
	   private int od_quantity;
	   private int od_price;
	   private String sp_code;
	   private String region;
}
