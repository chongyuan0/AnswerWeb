package cn.edu.lingnan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.QuestionTypeMapper;
import cn.edu.lingnan.pojo.QuestionType;

@Service
public class QuestionTypeService {

	@Autowired
	private QuestionTypeMapper questionTypeMapper;
	
	public void updateQuestionTypeByPrimaryKey(QuestionType questionType) {
		questionTypeMapper.updateByPrimaryKeySelective(questionType);
	}

	public void addQuestionType(QuestionType questionType) {
		questionTypeMapper.insert(questionType);
	}

	public void deleteQuestionType(Integer id) {
		questionTypeMapper.deleteByPrimaryKey(id);
		
	}

}
