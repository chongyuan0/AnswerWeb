package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.OptionsMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsExample;

@Service
public class OptionsService {

	@Autowired
	private OptionsMapper optionsMapper;

	public List<Options> selectOptionsByExample(OptionsExample options) {
		return optionsMapper.selectByExample(options);
	}

	public void updateByPrimaryKey(Options options) {
		optionsMapper.updateByPrimaryKeySelective(options);
	}
	
	
	
	
}
