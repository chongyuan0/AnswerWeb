package cn.edu.lingnan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.service.AnswerService;

@Controller
public class AnswerController extends BaseController {
	
	@Autowired
	private AnswerService answerService;
	
	/**
	 * @author huang
	 * 获取题目基础类型
	 */
	@ResponseBody
	@RequestMapping(value="user/getType")
	public Map<String, Object> getQuestionType() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> firstlist = answerService.findType();
		if (firstlist.size() <= 0) {
			map.put("error", "系统错误：一级菜单获取失败");
		} else {
			map.put("firstlist", firstlist);
		}
		return map;
	}
	
	/**
	 * @author huang
	 * 获取题目具体类型
	 */
	@ResponseBody
	@RequestMapping(value="user/getType/{id}")
	public Map<String, Object> getQuestionType(@PathVariable int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> secondlist = answerService.findType(id);
		if (secondlist.size() <= 0) {
			map.put("error", "系统错误：二级菜单获取失败");
		} else {
			map.put("secondlist", secondlist);
		}
		return map;
	}
	
	
}
