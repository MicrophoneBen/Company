package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.Client;

public interface CaseMapper {

	List<Client> listCase();
	Client getCase(Integer id);
	int deleteCase(Integer id);
	int updateCase(Client acase);
	int insertCase(Client acase);
}
