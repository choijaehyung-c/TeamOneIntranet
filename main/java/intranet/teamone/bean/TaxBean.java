package intranet.teamone.bean;


import java.util.List;

import lombok.Data;
import intranet.teamone.bean.OrderDetailBean;

@Data
public class TaxBean {
	private String tb_code;
	private String tb_oscode;
	private String tb_spcode;
	private String tb_spname;
	private String tb_spaddress; 
	private String tb_spbtype;
	private String tb_spcorpnum; 
	private String tb_spbkind;
	private String tb_clcode; 
	private String tb_clcorpnum; 
	private String tb_clname;
	private String tb_claddress;
	private String tb_clbtype;
	private String tb_clbkind; 
	private String tb_date; 
	private String tb_price;  
	private String tb_tax; 
	private String tb_ttprice; 
	private String tb_spemail;
	private String tb_clemail;
	private String tb_stcode; 
	private String spbtname; 
	private String spbkname; 
	private String clbtname; 
	private String clbkname; 	
	private List<OrderDetailBean> od;
}
