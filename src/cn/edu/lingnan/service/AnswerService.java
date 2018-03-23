package cn.edu.lingnan.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.mail.util.QEncoderStream;

import cn.edu.lingnan.controller.AnswerController;
import cn.edu.lingnan.dao.OptionsMapper;
import cn.edu.lingnan.dao.QuestionMapper;
import cn.edu.lingnan.dao.QuestionTypeMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsExample;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.QuestionTypeExample;
import cn.edu.lingnan.pojo.QuestionTypeExample.Criteria;

@Service
public class AnswerService {
	
	@Autowired
	private QuestionTypeMapper qtypeMapper;
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private OptionsMapper optionMapper;
	
	/**
	 * @author huang
	 * 查询一级菜单
	 */
	public List<QuestionType> findType() {
		QuestionTypeExample example = new QuestionTypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andBelongtypenoIsNull();
		List<QuestionType> list = qtypeMapper.selectByExample(example);
		return list;
	}
	
	/**
	 * @author huang
	 * 查询二级菜单
	 */
	public List<QuestionType> findType(int typeID) {
		QuestionTypeExample example = new QuestionTypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andBelongtypenoEqualTo(typeID);
		List<QuestionType> list = qtypeMapper.selectByExample(example);
		return list;
	}
	
	/**
	 * @author huang
	 * 根据题目类型返回题目
	 */
	public List<Question> getQuestionByType(int typeno) {
		QuestionExample questionExample = new QuestionExample();
		cn.edu.lingnan.pojo.QuestionExample.Criteria criteria = questionExample.createCriteria();
		criteria.andTypenoEqualTo(typeno);
		List<Question> list = questionMapper.randSelectQuestion(typeno, AnswerController.QUESTION_NUMBER);
		return list;
	}
	
	/**
	 * @author huang
	 * 根据题目获取选项
	 */
	public List<Options> getOptionsByQuestion(int questionno) {
		OptionsExample optionsExample = new OptionsExample();
		cn.edu.lingnan.pojo.OptionsExample.Criteria criteria = optionsExample.createCriteria();
		criteria.andQuestionnoEqualTo(questionno);
		
		List<Options> list = optionMapper.selectByExample(optionsExample);
		//将list的数据重新随机排列
		Collections.shuffle(list);
		return list;
	}
	
}
