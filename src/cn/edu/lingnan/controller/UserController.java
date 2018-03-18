package cn.edu.lingnan.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//多条件查询用户
	@RequestMapping("/selectUserByExample")
	public String selectUserByExample(Map<String,Object> map ,UserExample user){
		List<User> list = userService.selectUserByExample(user);
		//对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("userListPageInfo", pageInfo);
		//到时候前端写出网页后再修改到具体的页面
		return "user";
	}
	
	//根据id删除用户
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("id")Integer id){
		userService.deleteUser(id);
		return "user";
	}
	
	//注册用户
	@RequestMapping("/addUser")
	public String addUser(User user){
		userService.addUser(user);
		return "user";
	}
	
	//更新用户
	@RequestMapping("/updateUser")
	public String updateUser(User user){
		userService.updateUser(user);
		return "user";
	}
	
	
	
	
}
