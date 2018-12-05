package cn.hengxin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.CompanyMapper;
import cn.hengxin.entity.Company;
import cn.hengxin.service.ICompanyService;

@Service
@Transactional
public class CompanyServiceImpl implements ICompanyService{

	@Autowired
	private CompanyMapper companyMapper;
	
	@Override
	public List<Company> listCompany() {
		// TODO Auto-generated method stub
		return companyMapper.listCompany();
	}

	@Override
	public Company getCompany(Integer id) {
		// TODO Auto-generated method stub
		return companyMapper.getCompany(id);
	}

	@Override
	public int companyDelete(Integer id) {
		// TODO Auto-generated method stub
		return companyMapper.deleteCompany(id);
	}

	@Override
	public int companyRelease(Company company) {
		// TODO Auto-generated method stub
		return companyMapper.insertCompany(company);
	}

	@Override
	public int companyUpdate(Company company) {
		// TODO Auto-generated method stub
		return companyMapper.updateCompany(company);
	}

}
