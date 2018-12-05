package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.Company;


public interface CompanyMapper {

	List<Company> listCompany();
	Company getCompany(Integer id);
	int deleteCompany(Integer id);
	int updateCompany(Company company);
	int insertCompany(Company company);
}
