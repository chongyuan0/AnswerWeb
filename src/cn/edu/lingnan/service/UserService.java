package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.UserMapper;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.pojo.UserExample.Criteria;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	/*
	 * 登录
	 */
	public List<User> login(User user){
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
		return userMapper.selectByExample(userExample);
	}
	
	/*
	 * 注册
	 */
	public int register(User user) {
		return userMapper.insertSelective(user);
	}
}
