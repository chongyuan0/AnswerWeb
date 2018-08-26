package cn.edu.lingnan.utils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;
import com.baidubce.services.bos.model.BosObjectSummary;
import com.baidubce.services.bos.model.ListObjectsResponse;

/**
 * 
 * @author huang
 * 上传数据到百度云BOS对象存储中
 */
public class BOSUtil {
	
	private final static String ACCESS_KEY_ID = "27dc0f06da284aa38501a66fba533c43";	
	private final static String SECRET_ACCESS_KEY = "5df094ac33b94021b7ed9827122d8927";
	private final static String BUCKET_NAME = "answerweb";	//上传的文件夹名称
	

	/**
	 * @author huang
	 * @param file 文件对象
	 * @param path 存储路径，例如/resource/images/type/test.txt
	 * @return 成功失败
	 * 将文件上传都BOS对象存储中
	 */
	public static boolean upload(MultipartFile file, String path) {
		//创建BOS client
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials(new DefaultBceCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
		config.setEndpoint("gz.bcebos.com");
		BosClient client = new BosClient(config);
		
		try {
			InputStream inputStream = file.getInputStream();
			client.putObject(BUCKET_NAME, path, inputStream);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		/*  测试用例*/
		/*InputStream inputStream = new ByteArrayInputStream("hello java".getBytes());
		client.putObject(BUCKET_NAME, path, inputStream);*/
		return true;
	}
	
	/**
	 * @author huange
	 * @param filepath	原文件路径
	 * @param newpath	移动的路径
	 * @return
	 * 移动BOS的文件
	 */
	public static boolean moveFile(String filepath, String newpath) {
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials(new DefaultBceCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
		config.setEndpoint("gz.bcebos.com");
		BosClient client = new BosClient(config);
		client.copyObject(BUCKET_NAME, filepath, BUCKET_NAME, newpath);
		return true;
	}
	
	/**
	 * @author huang
	 * @param filepath 删除文件路径
	 * @return
	 * 删除BOS文件
	 */
	public static boolean deleteFile(String filepath) {
		BosClientConfiguration config = new BosClientConfiguration();
		config.setCredentials(new DefaultBceCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
		config.setEndpoint("gz.bcebos.com");
		BosClient client = new BosClient(config);
		try {
			client.getObjectMetadata(BUCKET_NAME, filepath);
			client.deleteObject(BUCKET_NAME, filepath);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public static void main(String[] args) {
		for (int i=1; i<=10; i++) {
			upload(null, "/temp/text" + i + ".txt");
		}
//		moveFile("/temp/text.txt", "/resource/images/ /test.txt");
//		deleteFile("/temp/text.txt");
	}
	
}
