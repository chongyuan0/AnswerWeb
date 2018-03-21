package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.RecordsMapper;
import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.RecordsExample;

@Service
public class RecordsService {

	private RecordsMapper recordsMapper;

	public List<Records> selectRecordsByExample(RecordsExample recordsExample) {
		return recordsMapper.selectByExample(recordsExample);
	}

	public void updateRecords(Records records) {
		recordsMapper.updateByPrimaryKeySelective(records);
	}

	public void addRecords(Records records) {
		recordsMapper.insert(records);
	}

	public void deleteRecords(Integer userNo) {
		recordsMapper.deleteByPrimaryKey(userNo);
	}
	
}
