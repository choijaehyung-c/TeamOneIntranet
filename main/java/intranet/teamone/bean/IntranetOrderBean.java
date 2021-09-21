package intranet.teamone.bean;

import java.util.List;

import lombok.Data;

@Data
public class IntranetOrderBean {
	private String rl_ioscode;
	private List<MroneOrderBean> mos;
}
