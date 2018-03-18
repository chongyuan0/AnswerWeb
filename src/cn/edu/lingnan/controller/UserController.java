package cn.edu.lingnan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.service.UserService;
import cn.edu.lingnan.utils.MailUtil;

@Controller
public class UserController extends BaseController {

	@Autowired
	private UserService userService;
	
	//用户登录
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, ModelMap model) {
		List<User> userlist = userService.login(user);
		//不存在用户
		if(userlist.size() <= 0) { 
			model.put("loginerror", true);
			return "index";
		}
		//存在用户，判断是否通过验证
		user = userlist.get(0);
		if(user.getStatus() == 0) {
			model.put("validationerror", true);
			model.put("userno", user.getUserno());
			return "index";
		}
		//通过验证
		super.session.setAttribute("user", user);
		//跳转到选择类型页面
		return "test";
	}
	
	//用户注册
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(User user) {
		//注册用户
		int flag = userService.register(user);
		//发送验证邮件
		MailUtil.sendValidatorMail(user.getEmail(), user.getUserno().toString());
		return "test";
	}
	
	//未验证发送验证邮件
	@RequestMapping(value="/{user.userno}/sendEmail", method=RequestMethod.POST)
	public String sendValidationEmail(@PathVariable User user) {
		MailUtil.sendValidatorMail(user.getEmail(), user.getUserno().toString());
		return "test";
	}
	
}
