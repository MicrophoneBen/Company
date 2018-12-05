package cn.hengxin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.CaseMapper;
import cn.hengxin.entity.Client;
import cn.hengxin.service.ICaseService;


@Service
@Transactional
public class CaseServiceImpl implements ICaseService{

	@Autowired
	private CaseMapper caseMapper;
	
	@Override
	public List<Client> listCase() {
		// TODO Auto-generated method stub
		return caseMapper.listCase();
	}

	@Override
	public Client getCase(Integer id) {
		// TODO Auto-generated method stub
		return caseMapper.getCase(id);
	}

	@Override
	public int caseRelease(Client acase) {
		// TODO Auto-generated method stub
		return caseMapper.insertCase(acase);
	}

	@Override
	public int caseUpdate(Client acase) {
		// TODO Auto-generated method stub
		return caseMapper.updateCase(acase);
	}

	@Override
	public int caseDelete(Integer id) {
		// TODO Auto-generated method stub
		return caseMapper.deleteCase(id);
	}
	
}
