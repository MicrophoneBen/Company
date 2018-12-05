package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.User;

public interface UserMapper {

	List<User> listUser(); 
	
	List<User> login(User user);
	
	int updatePassword(User user);
}
