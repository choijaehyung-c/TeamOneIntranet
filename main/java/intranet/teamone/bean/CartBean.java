package intranet.teamone.bean;

import lombok.Data;

@Data
public class CartBean {
	   private String spcode;
	   private String prname;
	   private String prcode;
	   private int price;
	   private int count;
	   private int ttprice;
}
