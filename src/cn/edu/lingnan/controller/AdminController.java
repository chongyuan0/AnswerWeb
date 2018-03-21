package cn.edu.lingnan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.service.UserService;

@Controller
public class AdminController extends BaseController {

	@Autowired
	private UserService userService;
	
	
}
