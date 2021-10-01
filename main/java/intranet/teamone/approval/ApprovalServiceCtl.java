package intranet.teamone.approval;



import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;

import intranet.teamone.bean.ApprovalBean;
import intranet.teamone.bean.EmployeeBean;
import intranet.teamone.bean.IntranetOrderBean;
import intranet.teamone.bean.MroneOrderBean;
import intranet.teamone.bean.OrderBean;
import intranet.teamone.bean.OrderDetailBean;
import intranet.teamone.bean.TaxBean;
import intranet.teamone.utils.Encryption;
import intranet.teamone.utils.ProjectUtils;



@Service
public class ApprovalServiceCtl {

	@Autowired
	ApprovalDAO dao;

	@Autowired
	ProjectUtils pu;

	@Autowired
	Encryption enc;

	public List<ApprovalBean> getApprovalList() {   
	      ApprovalBean ab = new ApprovalBean();
	      try {
	         ab.setAp_todpcode((String)pu.getAttribute("userDp"));
	         ab.setAp_toofcode((String)pu.getAttribute("userOf"));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      return dao.getApprovalList(ab);
	   }


	public List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {

		//return된 데이터
		List<OrderDetailBean> list = dao.getApprovalDetail(ab);
		for(int i=0; i<list.size();i++) {
			 list.get(i).setPr_name(this.getPrname(list.get(i).getOd_prcode()));
		
		}
		
		return list;
	}

	//상품코드로 상품이름을 가져오는 메서드
	String getPrname(String prcode){
		return dao.getPrname(prcode);
	}

	public List<ApprovalBean> getAnyApprovalList() {
	      ApprovalBean ab = new ApprovalBean();
	      try {
	         ab.setAp_todpcode((String)pu.getAttribute("userDp"));
	         ab.setAp_toofcode((String)pu.getAttribute("userOf"));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      return dao.getAnyApprovalList(ab);
	   }


	public String responseAppovalRefuse(ApprovalBean ab) {
		String msg = null;
		if(dao.responseAppovalRefuse(ab)){
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}


	public List<ApprovalBean> getSendApprovalList() {
	      ApprovalBean ab = new ApprovalBean();
	      try {
	         ab.setAp_fromdpcode((String)pu.getAttribute("userDp"));
	         ab.setAp_fromofcode((String)pu.getAttribute("userOf"));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	     
	      	 
	      return dao.getSendApprovalList(ab);
	   }
	


	public String IntranetOrderBean(IntranetOrderBean iob) {
		String msg = null;
		int check = 0;
		try {
			iob.setEp_code(enc.aesDecode((String)pu.getAttribute("userSs"),"session"));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		boolean tran = false;
		pu.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(dao.updateAP(iob)) {
			if(dao.insAA(iob)) {
				int totalPrice = dao.totalPrice(iob);
				System.out.println(totalPrice);
				try {
					int budget = Integer.parseInt(enc.aesDecode(dao.getBudget(iob), iob.getOf_code()));
					System.out.println(budget);

					budget = budget-totalPrice;
					System.out.println(budget);

					iob.setBg_budget(enc.aesEncode(Integer.toString(budget), iob.getOf_code()));
					if(dao.updateBudget(iob)) {

						for(int i=0; i<iob.getMos().size(); i++) {
							iob.getMos().get(i).setIos(iob.getRl_ioscode());
							if(dao.insRL(iob.getMos().get(i))) {
								check++;
							}
						}
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		if(check ==iob.getMos().size()) {
			tran = true;
		}else {
			tran = false;
		}

		pu.setTransactionResult(tran);

		msg = tran ? "success!" : "fail!";

		return msg;
	}


	public List<OrderDetailBean> getAnyApprovalDetail(ApprovalBean ab) {

		return dao.getAnyApprovalDetail(ab);
	}


	public String responseAnyAppoval(ApprovalBean ab) {
		String msg = null;
		if(dao.responseAnyAppoval(ab)) {
			msg="success";
		}else {
			msg="fail";
		}
		return msg;
	}


	public List<ApprovalBean> getSendAnyApprovalList() {
	      ApprovalBean ab = new ApprovalBean();
	      try {
	         ab.setAp_fromdpcode((String)pu.getAttribute("userDp"));
	         ab.setAp_fromofcode((String)pu.getAttribute("userOf"));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      return dao.getSendAnyApprovalList(ab);
	   }

	EmployeeBean getDrafterCtl() {

		String epcode = null;
		try {
			if(pu.getAttribute("userSs") != null) {
				epcode=enc.aesDecode((String)pu.getAttribute("userSs"),"session");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return dao.getDrafter(epcode);
	}

	List<EmployeeBean> getDPCtl() {
		return dao.getDP();

	}

	EmployeeBean inputDPCtl(String epcode) {
		return dao.inputDP(epcode);      
	}

	public List<OrderBean> getApprovalOrderList(String ofcode) {
		return dao.getApprovalOrderList(ofcode);
	}

	 OrderBean inputOrder(String oscode) {
		return dao.inputOrder(oscode);   
	}

	 List<TaxBean> getIssuedTaxCtl() {
		String epcode = null;
		String ofcode = null;

		try {
			if(pu.getAttribute("userSs") != null) {
				epcode=enc.aesDecode((String)pu.getAttribute("userSs"),"session");
				ofcode = dao.getofcode(epcode);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return dao.getIssuedTax(ofcode);
	}

	 TaxBean getIssuedTaxDetailCtl(String tbcode) {
		TaxBean tb = dao.getIssuedTaxDetail(tbcode);
		tb.setOd(dao.getTaxProduct(tb.getTb_oscode()));
		return tb;

	}


	 String issueApprovalCtl(ApprovalBean ab) {
		   String message = "failed";   
		   ab.setAp_fromdpcode(ab.getAp_fromdpcode() ); 
		   ab.setAp_fromofcode(ab.getAp_fromofcode() );
		   ab.setAp_todpcode(ab.getAp_todpcode());
		   ab.setAp_toofcode(ab.getAp_toofcode());
		   ab.setCg_type(ab.getCg_type());
		   ab.setCp_code(ab.getCp_code());
		   if(dao.insOs(ab)) {
		      ab.setAp_oscode(dao.getoscode());
		         if(dao.issueApproval(ab)) {
		            for(int i=0; i<ab.getCart().size(); i++) {            
		               ab.setOd_code(ab.getCart().get(i).getPrcode());
		               ab.setOd_price(ab.getCart().get(i).getTtprice());
		               ab.setOd_quantity(ab.getCart().get(i).getCount());
		               ab.setSp_code(ab.getCart().get(i).getSpcode());               
		               dao.insOd(ab);   

		            }         
		         }
		         message=ab.getAp_toofcode()+ab.getAp_todpcode()+dao.getOfDpName(ab);
		      }
		      return message;
		}
	 
	 String issueApprovalCtl2(ApprovalBean ab) {
		   String message = "Try Again";   
		   
		   ab.setAp_fromdpcode(ab.getAp_fromdpcode() ); 
		   ab.setAp_fromofcode(ab.getAp_fromofcode() );
		   ab.setAp_todpcode(ab.getAp_todpcode() );
		   ab.setAp_toofcode(ab.getAp_toofcode());
		   ab.setCg_type(ab.getCg_type());
		   ab.setCp_code(ab.getCp_code());
		   ab.setAn_text(ab.getAn_text());
		   if(dao.insAn(ab)) {
		         message="SUCCESS";
		   }
		      return message;
		}



}
