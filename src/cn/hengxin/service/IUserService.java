package cn.hengxin.service;

import org.springframework.stereotype.Service;
import cn.hengxin.entity.User;


public interface IUserService {

	User login(User user);
	int updatePassword(User user);
	
	
}
