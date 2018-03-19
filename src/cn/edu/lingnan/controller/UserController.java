package cn.edu.lingnan.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.service.UserService;
import cn.edu.lingnan.utils.MailUtil;

@Controller
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	// 用户登录
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(User user, ModelMap model) {
		List<User> userlist = userService.login(user);
		// 不存在用户
		if (userlist.size() <= 0) {
			model.put("loginerror", true);
			return "index";
		}
		// 存在用户，判断是否通过验证
		user = userlist.get(0);
		if (user.getStatus() == 0) {
			model.put("validationerror", true);
			model.put("userno", user.getUserno());
			return "index";
		}
		// 通过验证
		super.session.setAttribute("user", user);
		// 跳转到选择类型页面
		return "test";
	}

	// 用户注册
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public String register(@Valid User user, BindingResult result, Map<String, Object> map) {
		//判断输入是否合法
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			String error = "";
			for (ObjectError e : list) {
				error += e.getDefaultMessage() + "<br/>";
			}
			map.put("error", error);
			return "error";
		}
		//判断用户是否存在
		User user1 = userService.findUserByEmail(user.getEmail());
		if(user1 != null) {
			map.put("error", "用户已存在");
			return "error";
		}
		// 注册用户
		int flag = userService.register(user);
		if (flag > 0) {
			user1 = userService.findUserByEmail(user.getEmail());
			String html = "<html><head>"
					+ "<a href='http://localhost:8080/AnswerWeb/"+ user1.getUserno() + "/confirmEmail' >"
					+ "点击验证邮箱</a>"
					+ "</head></html>";
			MailUtil.sendValidatorMail(user.getEmail(), html);
			return "yuantest/success";
		} 
		map.put("error", "注册失败");
		return "error";
	}

	/**
	 *  未验证发送验证邮件
	 */
	@RequestMapping(value = "/{userno}/sendValidatorEmail")
	public String sendValidationEmail(@PathVariable int userno) {
		//验证链接
		String html = "<html><head>"
				+ "<a href='http://localhost:8080/AnswerWeb/"+ userno + "/confirmEmail' >点击验证邮箱</a>"
				+ "</head></html>";
		//发送邮件
		User user = userService.getUserByUserno(userno);
		if (MailUtil.sendValidatorMail(user.getEmail(), html))
			return "yuantest/success";
		else 
			return "error";
	}
	
	/**
	 * @author huang
	 * 邮箱验证成功
	 */
	@RequestMapping(value="/{userno}/confirmEmail")
	public String confirmValidatorEmail(@PathVariable int userno) {
		int flag = userService.confirmValidator(userno);
		if (flag > 0)
			return "yuantest/success";
		else 
			return "error";
	}
	
	/**
	 * @author huang
	 * 找回密码
	 */
	@RequestMapping(value="/user/findpassword", method=RequestMethod.POST)
	public ModelAndView findMyPassword(String email) {
		ModelAndView model = new ModelAndView();
		User user = userService.findUserByEmail(email);
		if (user == null) {
			model.setViewName("error");
			model.addObject("error", "没有该用户");
		} else {
			MailUtil.sendFindPasswordMail(email, user.getPassword());
			model.setViewName("yuantest/success");
			model.addObject("success", "找回密码邮件已发送");
		}
		return model;
	}

}
