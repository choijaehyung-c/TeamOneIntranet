package intranet.teamone.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import intranet.teamone.bean.BudgetBean;

@Service
public class AccountancyServiceEntrance {

	@Autowired
	AccountancyServiceCtl jasc;

	BudgetBean bg;

	public BudgetBean getBudgetList() {
		return jasc.getBudgetList();
	}

}
