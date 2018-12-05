package cn.hengxin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.CoreMapper;
import cn.hengxin.entity.Core;
import cn.hengxin.service.ICoreService;

@Service
@Transactional
public class CoreServiceImpl implements ICoreService{

	@Autowired
	private CoreMapper coreMapper;
	
	@Override
	public List<Core> listCore() {
		// TODO Auto-generated method stub
		return coreMapper.listCore();
	}

	@Override
	public Core getCore(Integer id) {
		// TODO Auto-generated method stub
		return coreMapper.getCore(id);
	}

	@Override
	public int coreRelease(Core core) {
		// TODO Auto-generated method stub
		return coreMapper.insertCore(core);
	}

	@Override
	public int coreUpdate(Core core) {
		// TODO Auto-generated method stub
		return coreMapper.updateCore(core);
	}

	@Override
	public int coreDelete(Integer id) {
		// TODO Auto-generated method stub
		return coreMapper.deleteCore(id);
	}

	
}
