package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.QuestionTypeMapper;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.QuestionTypeExample;
import cn.edu.lingnan.pojo.QuestionTypeExample.Criteria;

@Service
public class AnswerService {
	
	@Autowired
	private QuestionTypeMapper qtypeMapper;
	
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
	
}
