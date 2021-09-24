package intranet.teamone.bean;

import lombok.Data;

@Data
public class OrderBean {
   private String os_code;
   private String os_clcode;
   private String os_date;
   private String os_state;
   private String cl_name;
   private String od_prcode;
   private int od_quantity;
   private int pr_price;
   private int pr_tax;
   private String pr_name;
   
}