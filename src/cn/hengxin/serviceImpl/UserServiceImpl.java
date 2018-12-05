package cn.hengxin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.UserMapper;
import cn.hengxin.entity.User;
import cn.hengxin.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService{

	String[] codeSequence = { "1" , "2" , "3" , "4" , "5" ,"6","7","8","9","A","a","B","b","c","C"
			,"D","d","E","e","F","f","G","g","z","X","Q","v"};
	
	@Autowired
	private UserMapper userMapper;
	
	@Transactional(readOnly=true)
	public User login(User user) {
		
		List<User> users = userMapper.login(user);
		
		return users.size()>0?users.get(0):null;
	}

	@Override
	public int updatePassword(User user) {
	
		return userMapper.updatePassword(user);
	}

	
}
