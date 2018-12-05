package cn.hengxin.service;

import java.util.List;
import cn.hengxin.entity.Client;

public interface ICaseService {

	List<Client> listCase();
	Client getCase(Integer id);
	int caseRelease(Client acase);
	int caseUpdate(Client aase);
	int caseDelete(Integer id);

}
