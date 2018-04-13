package cn.edu.lingnan.utils;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;

/**
 * 
 * @author huang
 * 上传数据到百度云BOS对象存储中
 */
public class BOSUtil {
	
	private final static String ACCESS_KEY_ID = "27dc0f06da284aa38501a66fba533c43";	
	private final static String SECRET_ACCESS_KEY = "5df094ac33b94021b7ed9827122d8927";
	private final static String BUCKET_NAME = "answerweb";	//上传的文件夹名称
	
	/*private final static String ACCESS_KEY_ID = "55fa371503834e4a8a3fa67d6a89cd10";	
	private final static String SECRET_ACCESS_KEY = "8d15e88309954f938c3a65a5855619a5";
	private final static String BUCKET_NAME = "cn-edu-lingnan";*/
	

	/**
	 * 
	 * @param file 文件对象
	 * @param path 存储路径，例如/resource/images/type/test.txt
	 * @return 成功失败
	 * 将文件上传都BOS对象存储中
	 */
	public static boolean upload(MultipartFile file, String path) {
		System.out.println(file.getName());
		System.out.println(path);
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
		
		/*  测试用例
		InputStream inputStream = new ByteArrayInputStream("hello java".getBytes());
		client.putObject(BUCKET_NAME, path, inputStream);
		*/
		
		return true;
	}
	
}
