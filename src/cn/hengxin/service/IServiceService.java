package cn.hengxin.service;

import java.util.List;

import cn.hengxin.entity.Service;

public interface IServiceService {

	int serviceRelease(Service service);
	Service getService(Integer id);
	int deleteService(Integer id);
	int serviceUpdate(Service service);
	List<Service> listService();
	List<Service> listServiceByType(String type);
}
