package cn.edu.lingnan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsList;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;
import cn.edu.lingnan.service.OptionsService;
import cn.edu.lingnan.service.QuestionService;
import cn.edu.lingnan.service.QuestionTypeService;

@Controller
public class QuestionController extends BaseController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuestionTypeService questionTypeService;
	
	@Autowired
	private OptionsService optionsService;
	

	/**
	 * 分页根据条件查找试题
	 * @param question
	 * @param map
	 * @param pn
	 * @author lizhi
	 */
	@RequestMapping("/selectQuestion")
	public String selectQuestion(Question question, Map<String, Object> map,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("toid")Integer toid) {
		// 每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn, 6);
		List<Question> list = questionService.selectQuestionByExample(question);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("pageInfo", pageInfo);
		//找出所有三级菜单类型，返回到前端多条件选择
		map.put("questionTypeList",questionTypeService.getAllQuestionType());
		//在选项卡一中显示
		map.put("toid", toid);
		// 到时候前端写出网页后再修改到具体的页面
		return "/admin/questionList";
	}
	
	/**
	 * 更新试题第一步
	 * @param question
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirst")
	public String updateQuestionFirst(@RequestParam("questionno")Integer questionno,Map<String,Object> map,@RequestParam("pn") Integer pn){
		//找出具体题目
		map.put("question",questionService.getQuestionByKey(questionno));
		//找出题目的候选答案
		map.put("optionsList",optionsService.getQuestionOptions(questionno));
		//找出所有三级菜单类型，返回到更新页面
		map.put("questionTypeList",questionTypeService.getAllQuestionType());
		map.put("pn",pn);
		return "/admin/updateQuestion";
	}
	
	/**
	 * 更新试题第二步
	 * @param question
	 * @param pn
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecond")
	public String updateQuestionSecond(Question question,@RequestParam("pn") Integer pn,OptionsList optionsList){
		questionService.updateSelective(question);
		for(Options options:optionsList.getOptionsList()){
			optionsService.updateByPrimaryKey(options);
		}
		redirectAttributes.addAttribute("pn",pn);
		redirectAttributes.addAttribute("toid",1);
		return "redirect:/selectQuestion";
	}
	
	
	

	/**
	 * 上传题目的图片，视频，音频
	 * @param file
	 * @param typename
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/addQuestionFile", produces = "text/html;charset=UTF-8")
	public String addQuestionFile(@RequestParam(value = "file", required = false) MultipartFile file
			) throws IllegalStateException, IOException {
		
		String strExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
		String path = session.getServletContext().getRealPath("/resource/images/question");
		if(strExtension.equals("mp3")){
			path = session.getServletContext().getRealPath("/resource/radio");
		}else if(strExtension.equals("mp4")){
			path = session.getServletContext().getRealPath("/resource/video");
		}

		// fileName唯一性
		int a = ThreadLocalRandom.current().nextInt(100,999);
		String fileName =+ a +"-"+ System.currentTimeMillis()+ file.getOriginalFilename();

		File targetFile = new File(path, fileName);

		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		/**
		 * MultipartFile接口中定义了如下很多有用的方法。 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
		 * 使用isEmpty()方法判断上传文件是否为空文件，以此决定是否拒绝空文件。
		 * 使用getInputStream()方法将文件读取为java.io.InputStream流对象。
		 * 使用getContentType()方法获得文件类型，以此决定允许上传的文件类型。
		 * 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
		 */
		file.transferTo(targetFile);
		//String fileUrl = request.getContextPath() + "/resource/images/type/" + fileName;
		return fileName;
	}
	
	
	/**
	 * 增加试题
	 * @param question
	 * @author lizhi
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/addQuestion")
	public String addQuestion(Question question,OptionsList optionsList,@RequestParam("pn") Integer pn) throws IllegalStateException, IOException{
		
		System.out.println(question.getContent());
		questionService.insertQuestion(question);
		for(Options options:optionsList.getOptionsList()){
			options.setQuestionno(question.getQuestionno());
			optionsService.insert(options);
		}
		redirectAttributes.addAttribute("pn",pn);
		redirectAttributes.addAttribute("toid",1);
		return "redirect:/selectQuestion";
	}
	
	/**
	 * 根据试题id删除试题
	 * @param id
	 * @author lizhi
	 */
	/*@RequestMapping(value="/deleteQuestion/{id}",method=RequestMethod.DELETE)
	public String deleteQuestion(@PathVariable(value="id") Integer id){
		questionService.deleteQuestion(id);
		return "/admin/index";
	}*/
	
	/**
	 * 根据试题id删除试题
	 * @param id
	 * @author lizhi
	 */
	@RequestMapping(value="/deleteQuestion")
	public String deleteQuestion(@RequestParam("questionno") Integer questionno,@RequestParam("pn") Integer pn){
		questionService.deleteQuestion(questionno);
		redirectAttributes.addAttribute("pn", pn);
		redirectAttributes.addAttribute("toid",1);
		return "redirect:/selectQuestion";
	}
	
}
