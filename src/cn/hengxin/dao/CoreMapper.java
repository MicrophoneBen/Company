package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.Core;



public interface CoreMapper {
	
	int insertCore(Core core);
	int updateCore(Core core);
	int deleteCore(Integer id);
	Core getCore(Integer id);
	List<Core> listCore();
	
}
