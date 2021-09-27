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

	public List<ApprovalBean> getApprovalList(ApprovalBean ab) {

		return dao.getApprovalList(ab);
	}


	public List<OrderDetailBean> getApprovalDetail(ApprovalBean ab) {

		return dao.getApprovalDetail(ab);
	}


	public List<ApprovalBean> getAnyApprovalList(ApprovalBean ab) {

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


	public List<ApprovalBean> getSendApprovalList(ApprovalBean ab) {

		return dao.getSendApprovalList(ab);
	}


	public String IntranetOrderBean(IntranetOrderBean iob) {
		String msg = null;
		int check = 0;
		iob.setEp_code("21001");
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


	public List<ApprovalBean> getSendAnyApprovalList(ApprovalBean ab) {

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

	public OrderBean inputOrder(String oscode) {
		return dao.inputOrder(oscode);   
	}

	public List<TaxBean> getIssuedTaxCtl() {
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

	public TaxBean getIssuedTaxDetailCtl(String tbcode) {
		TaxBean tb = dao.getIssuedTaxDetail(tbcode);
		tb.setOd(dao.getTaxProduct(tb.getTb_oscode()));
		return tb;

	}



}
