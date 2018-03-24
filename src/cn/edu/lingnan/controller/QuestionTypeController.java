package cn.edu.lingnan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.service.QuestionTypeService;

@Controller
public class QuestionTypeController extends BaseController {

	@Autowired
	private QuestionTypeService questionTypeService;
	
	@RequestMapping("/selectQuestionType")
	public String selectQuestionType(){
		return "";
	}

	/**
	 * 更新一级菜单（题目类型）(更新一级菜单需要超级管理员权限,使用拦截器获取权限)
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirstType")
	public String updateQuestionFirstType(QuestionType questionType) {
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		return "/admin/index";
	}

	/**
	 * 更新二级菜单（题目类型）(更新二级菜单只需普通管理员权限)
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecondType")
	public String updateQuestionSecondType(QuestionType questionType) {
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		return "/admin/index";
	}
	
	/**
	 * 新增一级菜单（题目类型）（增加一级菜单需要超级管理员权限,使用拦截器获取权限）
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionFirstType")
	public String addQuestionFirstType(QuestionType questionType){
		questionTypeService.addQuestionType(questionType);
		return "/admin/index";
	}
	
	/**
	 * 新增二级菜单（题目类型）（增加二级菜单只需普通管理员权限）
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionSecondType")
	public String addQuestionSecondType(QuestionType questionType){
		questionTypeService.addQuestionType(questionType);
		return "/admin/index";
	}
	
	/**
	 * 删除一级菜单(需要超级管理员权限,通过拦截器获取权限)
	 * 数据库已有级联删除，不再做业务处理
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteQuestionFirstType/{id}",method=RequestMethod.DELETE)
	public String deleteQuestionFirstType(@PathVariable(value="id")Integer id){
		questionTypeService.deleteQuestionType(id);
		return "/admin/index";
	}
	
	/**
	 * 删除二级菜单(只需普通管理员权限)
	 * 数据库已有级联删除，不再做业务处理
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deleteQuestionSecondType/{id}",method=RequestMethod.DELETE)
	public String deleteQuestionSecondType(@PathVariable(value="id")Integer id){
		questionTypeService.deleteQuestionType(id);
		return "/admin/index";
	}

}
