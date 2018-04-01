package cn.edu.lingnan.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import cn.edu.lingnan.dao.QuestionTypePlus;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.service.QuestionTypeService;

@Controller
public class QuestionTypeController extends BaseController {

	@Autowired
	private QuestionTypeService questionTypeService;

	

	/**
	 * 一级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionFirstType")
	public Map questionFirstType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 每页显示6条数据，且当前页是参数pn
		PageHelper.startPage(pn, 6);
		List<QuestionType> firstTypeList = questionTypeService.questionFirstType(questionType);
		PageInfo pageInfo = new PageInfo<>(firstTypeList, 5);
		map.put("pageInfo", pageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultFirstType = questionTypeService.questionFirstType(new QuestionType());
		map.put("defaultFirstType", defaultFirstType);
		return map;
	}

	/**
	 * 二级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionSecondType")
	public Map questionSecondType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> secondTypeList = questionTypeService.questionSecondType(questionType, pn);

		PageInfo<QuestionType> secondpageInfo = new PageInfo<>(secondTypeList);
		map.put("pageInfo", secondpageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultSecondType = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("defaultSecondType", defaultSecondType);
		List<QuestionType> defaultFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("defaultFirstTypeList", defaultFirstTypeList);
		return map;
	}

	/**
	 * 三级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionThreeType")
	public Map questionThreeType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> threeTypeList = questionTypeService.questionThreeType(questionType, pn);

		PageInfo<QuestionType> threepageInfo = new PageInfo<>(threeTypeList);
		map.put("pageInfo", threepageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultThreeType = questionTypeService.questionThreeType(new QuestionType(), -1);
		map.put("defaultThreeType", defaultThreeType);
		List<QuestionType> defaultSecondType = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("defaultSecondTypeList", defaultSecondType);
		return map;
	}

	/**
	 * 更新一级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirstTypeFirst")
	public String updateQuestionFirstTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		map.put("pn", pn);
		return "/admin/updateQuestionFirstType";
	}
	
	
	/**
	 * 更新一级菜单第二步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirstTypeSecond")
	public String updateQuestionFirstTypeSecond(QuestionType questionType,Integer pn,Map<String,Object> map) {
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		map.put("toid", 1);
		map.put("FirstTypepn", pn);
		return "/admin/questionType";
	}
	
	
	
	/**
	 * 更新二级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecondTypeFirst")
	public String updateQuestionSecondTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		//获取一级菜单作为上级菜单
		List<QuestionType> questionFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("questionFirstTypeList", questionFirstTypeList);
		map.put("pn", pn);
		return "/admin/updateQuestionSecondType";
	}
	/**
	 * 更新二级菜单第二步
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecondTypeSecond")
	public String updateQuestionSecondTypeSecond(QuestionType questionType,Integer pn,Map<String,Object> map) {
		//更新二级菜单
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		
		map.put("toid", 2);
		map.put("SecondTypepn", pn);
		return "/admin/questionType";
	}
	
	
	
	
	
	/**
	 * 更新三级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionThreeTypeFirst")
	public String updateQuestionThreeTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		//查出所有二级菜单，作为上级菜单
		List<QuestionType> questionSecondTypeList = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("questionSecondTypeList", questionSecondTypeList);
		
		map.put("pn", pn);
		return "/admin/updateQuestionThreeType";
	}
	
	
	/**
	 * 更新三级菜单第二步
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionThreeTypeSecond")
	public String updateQuestionThreeTypeSecond(QuestionType questionType,Integer pn,Map<String,Object> map) {
		//更新三级菜单
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		
		map.put("toid", 3);
		map.put("ThreeTypepn", pn);
		return "/admin/questionType";
	}

	

	/**
	 * 上传菜单图片并且预览
	 * @param file
	 * @param typename
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/addQuestionTypeImages", produces = "text/html;charset=UTF-8")
	public String addQuestionTypeImages(@RequestParam(value = "file", required = false) MultipartFile file
			) throws IllegalStateException, IOException {
		
		String path = session.getServletContext().getRealPath("/resource/images/type");

		// fileName唯一性
		int a = ThreadLocalRandom.current().nextInt(10000, 99999);
		String fileName =+ a +"-"+ System.currentTimeMillis() + "-"+file.getOriginalFilename();

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
	 * 增加一级菜单
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionFirstType")
	public String addQuestionFirstType(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename){
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 1);
		session.setAttribute("FirstTypepn",99999);
		return "/admin/questionType";
	}
	
	

	/**
	 * 新增二级菜单第一步，查出所有二级菜单的上级菜单（增加二级菜单只需普通管理员权限）
	 * 
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionSecondTypeFirst")
	public String addQuestionSecondType(Map<String,Object> map) {
		List<QuestionType> questionFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("questionFirstTypeList", questionFirstTypeList);
		return "/admin/addQuestionSecondType";
	}
	
	
	/**
	 * 增加二级菜单第二步
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionSecondTypeSecond")
	public String addQuestionSecondTypeSecond(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename,Integer belongtypeno){
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionType.setBelongtypeno(belongtypeno);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 2);
		session.setAttribute("SecondTypepn",99999);
		return "/admin/questionType";
	}
	
	

	/**
	 * 新增三级菜单第一步，查出所有二级菜单
	 * 
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionThreeTypeFirst")
	public String addQuestionThreeTypeFirst(Map<String,Object> map) {
		List<QuestionType> questionSecondTypeList = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("questionSecondTypeList", questionSecondTypeList);
		return "/admin/addQuestionThreeType";
	}
	
	/**
	 * 增加三级菜单第二步
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionThreeTypeSecond")
	public String addQuestionThreeTypeSecond(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename,Integer belongtypeno){
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionType.setBelongtypeno(belongtypeno);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 3);
		session.setAttribute("ThreeTypepn",99999);
		return "/admin/questionType";
	}
	

	/**
	 * 删除一级菜单(需要超级管理员权限,通过拦截器获取权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionFirstType")
	public String deleteQuestionFirstType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",1);
		session.setAttribute("FirstTypepn", pn);
		return "/admin/questionType";
	}

	/**
	 * 删除二级菜单(只需普通管理员权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionSecondType")
	public String deleteQuestionSecondType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",2);
		session.setAttribute("SecondTypepn", pn);
		return "/admin/questionType";
	}

	/**
	 * 删除三级菜单(只需普通管理员权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionThreeType")
	public String deleteQuestionThreeType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",3);
		session.setAttribute("ThreeTypepn", pn);
		return "/admin/questionType";
	}
	
}
