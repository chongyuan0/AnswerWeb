package cn.edu.lingnan.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;
import cn.edu.lingnan.service.QuestionService;

@Controller
public class QuestionController extends BaseController {
	
	@Autowired
	private QuestionService questionService;
	

	/**
	 * 分页根据条件查找试题
	 * @param question
	 * @param map
	 * @param pn
	 * @author lizhi
	 */
	@RequestMapping("/selectQuestion")
	public String selectQuestion(QuestionExample question, Map<String, Object> map,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn, 8);
		List<Question> list = questionService.selectQuestionByExample(question);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("questionListPageInfo", pageInfo);
		// 到时候前端写出网页后再修改到具体的页面
		return "/admin/index";
	}
	
	/**
	 * 更新试题
	 * @param question
	 * @author lizhi
	 */
	public String updateQuestion(Question question){
		questionService.updateByPrimaryKey(question);
		return "/admin/index";
	}
	
	/**
	 * 增加试题
	 * @param question
	 * @author lizhi
	 */
	@RequestMapping("/addQuestion")
	public String addQuestion(Question question){
		questionService.insertQuestion(question);
		return "/admin/index";
	}
	
	/**
	 * 根据试题id删除试题
	 * @param id
	 * @author lizhi
	 */
	@RequestMapping(value="/deleteQuestion/{id}",method=RequestMethod.DELETE)
	public String deleteQuestion(@PathVariable(value="id") Integer id){
		questionService.deleteQuestion(id);
		return "/admin/index";
	}
	
}
