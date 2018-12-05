package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.Service;


public interface ServiceMapper {
	
	int insertService(Service service);
	int updateService(Service service);
	int deleteService(Integer id);
	Service getService(Integer id);
	List<Service> listServiceByType(String type);
	List<Service> listService();
	
}
