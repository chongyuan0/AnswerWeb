package cn.edu.lingnan.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.edu.lingnan.dao.TempUrlMapper;
import cn.edu.lingnan.dao.UserMapper;
import cn.edu.lingnan.pojo.TempUrl;
import cn.edu.lingnan.pojo.TempUrlExample;
import cn.edu.lingnan.pojo.TempUrlExample.Criteria;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.utils.BOSUtil;

/**
 * 
 * @author huang
 * 定时任务
 */
@Component
@Lazy(false)
public class TaskService {
	
	@Autowired
	private TempUrlMapper tempUrlMapper;
	@Autowired
	private UserMapper userMapper;
	/**
	 * @author huang
	 * 定时清理BOS中当前时间5分钟前的文件
	 */
	@Scheduled(cron="0 0/5 * * * ?")
	public void timerDeleteBosTemp() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		Long nowdate = Long.parseLong(format.format(new Date()));
		//找出数据库1分钟前的数据
		String oldtime = new Long(nowdate-500).toString();
		TempUrlExample tempExample = new TempUrlExample();
		Criteria criteria = tempExample.createCriteria();
		criteria.andNewdateLessThan(oldtime);
		List<TempUrl> tempList = tempUrlMapper.selectByExample(tempExample);
		for(TempUrl t : tempList) {
			BOSUtil.deleteFile("temp/" + t.getFileurl());
			tempUrlMapper.deleteByPrimaryKey(t.getTempurlid());
		}
	}
	
	/**
	 * @author huang
	 * 每天2：30清理没有验证的用户
	 */
	@Scheduled(cron = "0 30 2 * * ?")
	public void timerDeleteNoValidatorUser(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		Long nowdate = Long.parseLong(format.format(new Date()));
		//找出数据库一天前的数据
		String oldtime = new Long(nowdate-1000000).toString();
		UserExample userExample = new UserExample();
		cn.edu.lingnan.pojo.UserExample.Criteria criteria = userExample.createCriteria();
		criteria.andNewdateLessThan(oldtime).andStatusEqualTo(0);
		userMapper.deleteByExample(userExample);
	}

}
