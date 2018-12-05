package cn.hengxin.service;

import java.util.List;

import cn.hengxin.entity.Company;

public interface ICompanyService {

	List<Company> listCompany();
	Company getCompany(Integer id);
	int companyDelete(Integer id);
	int companyRelease(Company company);
	int companyUpdate(Company company);
}
