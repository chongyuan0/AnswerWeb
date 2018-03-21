package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.QuestionMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;

@Service
public class QuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;

	public List<Question> selectQuestionByExample(QuestionExample question) {
		List<Question> list = questionMapper.selectByExample(question);
		return list;
	}

	public void updateByPrimaryKey(Question question) {
		questionMapper.updateByPrimaryKeySelective(question);
	}

	public void insertQuestion(Question question) {
		questionMapper.insert(question);
	}

	public void deleteQuestion(Integer id) {
		questionMapper.deleteByPrimaryKey(id);
	}
	
	
	
}
