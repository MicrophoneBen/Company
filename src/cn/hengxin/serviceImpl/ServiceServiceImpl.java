package cn.hengxin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.ServiceMapper;
import cn.hengxin.entity.Service;
import cn.hengxin.service.IServiceService;

@org.springframework.stereotype.Service
@Transactional
public class ServiceServiceImpl implements IServiceService{

	@Autowired
	private ServiceMapper serviceMapper;
	
	@Override
	public int serviceRelease(Service service) {
		return serviceMapper.insertService(service);
	}

	@Override
	public Service getService(Integer id) {
		// TODO Auto-generated method stub
		return serviceMapper.getService(id);
	}

	@Override
	public int deleteService(Integer id) {
		// TODO Auto-generated method stub
		return serviceMapper.deleteService(id);
	}

	@Override
	public int serviceUpdate(Service service) {
		// TODO Auto-generated method stub
		return serviceMapper.updateService(service);
	}

	@Override
	public List<Service> listService() {
		// TODO Auto-generated method stub
		return serviceMapper.listService();
	}

	@Override
	public List<Service> listServiceByType(String type) {
		// TODO Auto-generated method stub
		return serviceMapper.listServiceByType(type);
	}
	
	
	
}
