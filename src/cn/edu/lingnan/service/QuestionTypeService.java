package cn.edu.lingnan.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.QuestionTypeMapper;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.QuestionTypeExample;
import cn.edu.lingnan.pojo.QuestionTypeExample.Criteria;

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

	/**
	 * 获取三级菜单
	 * 
	 * @author lizhi
	 */
	public List<QuestionType> getAllQuestionType() {

		// 得到一级菜单
		QuestionTypeExample firstExample = new QuestionTypeExample();
		Criteria criteria = firstExample.createCriteria();
		criteria.andBelongtypenoIsNull();
		List<QuestionType> firstType = questionTypeMapper.selectByExample(firstExample);
		// System.out.println("firstType:"+firstType);

		// 获取一级菜单的typeno
		List<Integer> firstTypeno = new ArrayList<Integer>();
		for (QuestionType questionType : firstType) {
			firstTypeno.add(questionType.getTypeno());
		}
		// System.out.println("firstTypeno:"+firstTypeno);

		// 得到二级菜单
		QuestionTypeExample secondExample = new QuestionTypeExample();
		Criteria secondCriteria = secondExample.createCriteria();
		secondCriteria.andBelongtypenoIn(firstTypeno);
		List<QuestionType> secondType = questionTypeMapper.selectByExample(secondExample);
		// System.out.println("secondType:"+secondType);

		// 获取二级菜单的typeno
		List<Integer> secondTypeno = new ArrayList<Integer>();
		for (QuestionType questionType : secondType) {
			secondTypeno.add(questionType.getTypeno());
		}
		// System.out.println("secondTypeno:"+secondTypeno);

		// 得到三级菜单集合
		QuestionTypeExample thirdExample = new QuestionTypeExample();
		Criteria thirdCriteria = thirdExample.createCriteria();
		thirdCriteria.andBelongtypenoIn(secondTypeno);
		List<QuestionType> thirdType = questionTypeMapper.selectByExample(thirdExample);
		// System.out.println("thirdType:"+thirdType);
		return thirdType;

	}

	/**
	 * 一级菜单
	 * 
	 * @return
	 */
	public List<QuestionType> questionFirstType(QuestionType questionType) {
		QuestionTypeExample firstExample = new QuestionTypeExample();
		Criteria criteria = firstExample.createCriteria();
		criteria.andBelongtypenoIsNull();
		if(questionType.getTypename()!=null&&!questionType.getTypename().equals("")){
			criteria.andTypenameEqualTo(questionType.getTypename());
		}
		List<QuestionType> firstType = questionTypeMapper.selectByExample(firstExample);
		return firstType;
	}

	public List<QuestionType> questionSecondType(QuestionType questionTypeExample) {

		// 得到一级菜单
		QuestionTypeExample firstExample = new QuestionTypeExample();
		Criteria criteria = firstExample.createCriteria();
		criteria.andBelongtypenoIsNull();
		List<QuestionType> firstType = questionTypeMapper.selectByExample(firstExample);
		// System.out.println("firstType:"+firstType);

		// 获取一级菜单的typeno
		List<Integer> firstTypeno = new ArrayList<Integer>();
		for (QuestionType questionType : firstType) {
			firstTypeno.add(questionType.getTypeno());
		}

		//获取二级菜单
		QuestionTypeExample secondExample = new QuestionTypeExample();
		Criteria secondCriteria = secondExample.createCriteria();
		secondCriteria.andBelongtypenoIn(firstTypeno);
		if(questionTypeExample.getTypename()!=null&&!questionTypeExample.getTypename().equals("")){
			secondCriteria.andTypenameEqualTo(questionTypeExample.getTypename());
		}
		if(questionTypeExample.getBelongtypeno()!=null){
			secondCriteria.andBelongtypenoEqualTo(questionTypeExample.getTypeno());
		}
		List<QuestionType> secondType = questionTypeMapper.selectByExample(secondExample);
		return secondType;
	}
	
	/**
	 * 获取三级菜单
	 * 
	 * @author lizhi
	 */
	public List<QuestionType> questionThreeType(QuestionType questionTypeExample) {

		// 得到一级菜单
		QuestionTypeExample firstExample = new QuestionTypeExample();
		Criteria criteria = firstExample.createCriteria();
		criteria.andBelongtypenoIsNull();
		List<QuestionType> firstType = questionTypeMapper.selectByExample(firstExample);
		// System.out.println("firstType:"+firstType);

		// 获取一级菜单的typeno
		List<Integer> firstTypeno = new ArrayList<Integer>();
		for (QuestionType questionType : firstType) {
			firstTypeno.add(questionType.getTypeno());
		}
		// System.out.println("firstTypeno:"+firstTypeno);

		// 得到二级菜单
		QuestionTypeExample secondExample = new QuestionTypeExample();
		Criteria secondCriteria = secondExample.createCriteria();
		secondCriteria.andBelongtypenoIn(firstTypeno);
		List<QuestionType> secondType = questionTypeMapper.selectByExample(secondExample);
		// System.out.println("secondType:"+secondType);

		// 获取二级菜单的typeno
		List<Integer> secondTypeno = new ArrayList<Integer>();
		for (QuestionType questionType : secondType) {
			secondTypeno.add(questionType.getTypeno());
		}
		// System.out.println("secondTypeno:"+secondTypeno);

		// 得到三级菜单集合
		QuestionTypeExample thirdExample = new QuestionTypeExample();
		Criteria thirdCriteria = thirdExample.createCriteria();
		thirdCriteria.andBelongtypenoIn(secondTypeno);
		if(questionTypeExample.getTypename()!=null&&!questionTypeExample.getTypename().equals("")){
			thirdCriteria.andTypenameEqualTo(questionTypeExample.getTypename());
		}
		if(questionTypeExample.getBelongtypeno()!=null){
			thirdCriteria.andBelongtypenoEqualTo(questionTypeExample.getTypeno());
		}
		List<QuestionType> thirdType = questionTypeMapper.selectByExample(thirdExample);
		// System.out.println("thirdType:"+thirdType);
		return thirdType;

	}

}
