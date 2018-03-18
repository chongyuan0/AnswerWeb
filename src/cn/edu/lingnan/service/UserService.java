package cn.edu.lingnan.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.UserMapper;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public List<User> selectUserByExample(UserExample user){
		return userMapper.selectByExample(user);
	}

	public void deleteUser(Integer id) {
		userMapper.deleteByPrimaryKey(id);
	}

	public void addUser(User user) {
		userMapper.insertSelective(user);
	}
	
}
