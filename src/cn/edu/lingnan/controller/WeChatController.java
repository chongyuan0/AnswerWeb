package cn.edu.lingnan.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import cn.edu.lingnan.pojo.wechatpojo.AutowebParams;
import cn.edu.lingnan.pojo.wechatpojo.WeChatUser;
import cn.edu.lingnan.service.WeChatService;
import cn.edu.lingnan.utils.HttpUtil;
import cn.edu.lingnan.utils.SignUtil;

/**
 * 
 * @author huang
 * 与微信交互的Controller
 */
@Controller
public class WeChatController extends BaseController {
	
	/**
	 * @author huang
	 * @param req
	 * @param resp
	 * @throws IOException
	 * 用于绑定微信公众号
	 */
	@RequestMapping(value="wechat/core", method=RequestMethod.GET)
	public void bindingWeChatGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		PrintWriter out = resp.getWriter();
		if(SignUtil.checkSignature(signature, timestamp, nonce))
			out.print(echostr);
		out.close();
		out = null;
	}
	
	/**
	 * @author huang
	 * @param req
	 * @param resp
	 * @throws IOException
	 * 用于绑定后用户与公众号的交互
	 */
	@RequestMapping(value="wechat/core", method=RequestMethod.POST)
	public void bindingWeChatPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String s = new WeChatService().disposeMessage(req);
		PrintWriter out = resp.getWriter();
		out.print(s);
		out.close();
		out = null;
	}
	
	/**
	 * @author huang
	 * 用户打开网页,对公众号授权获取用户的信息
	 * @throws IOException 
	 */
	@RequestMapping(value="wechat/authorize")
	public void userAuthorization(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//生成手动授权链接
		String authorizeUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?";	//固定链接
		String appid = "appid=wx25c5b6d09bcd8685&"; 	//公众号id
		String redirect_uri = "redirect_uri=http://zhrkim.natappfree.cc/AnswerWeb/wechat/getuserinfo&";	//授权后跳转的链接
		String response_type = "response_type=code&";	//固定参数
		String scope_userinfo = "scope=snsapi_userinfo&";	//手动授权
		String scope_base = "scope=snsapi_base&";	//静默授权
		String state = "state=STATE&connect_redirect=1";	//重定向携带的参数, connect_redirect处理安卓获取会重复获取
		String footuri = "#wechat_redirect";	//固定参数
		authorizeUrl = authorizeUrl+appid+redirect_uri+response_type+scope_userinfo+state+footuri;
		System.out.println(authorizeUrl);
		//向用户发送授权链接
		resp.sendRedirect(authorizeUrl);
	}
	
	/**
	 * @author huang
	 * 用户同意授权后获取用户的信息
	 * @throws IOException 
	 */
	@RequestMapping(value="wechat/getuserinfo", method=RequestMethod.GET)
	public void getUserInfo(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String code = req.getParameter("code");
		if(code != null) {
			//获取access_token和openid
			String tokenUri = "https://api.weixin.qq.com/sns/oauth2/access_token?";	//固定链接
			String appid = "appid=wx25c5b6d09bcd8685&";		//公众号id
			String secret = "secret=e8893cf8175a33631f1c9bbd8ee3957c&";
			code = "code=" + code + "&grant_type=authorization_code";
			tokenUri = tokenUri + appid + secret + code;
			String json = HttpUtil.getReturnJson(tokenUri, null);
			AutowebParams autoWebParams = new AutowebParams();
			Gson gson = new Gson();
			autoWebParams = gson.fromJson(json, new AutowebParams().getClass());
			//获取用户信息
			String userinfouri = "https://api.weixin.qq.com/sns/userinfo?"
					+ "access_token=" + autoWebParams.getAccess_token() 
					+ "&openid="+ autoWebParams.getOpenid()+ "&lang=zh_CN";
			String json2 = HttpUtil.getReturnJson(userinfouri, null);
			WeChatUser wechatUser = gson.fromJson(json2, new WeChatUser().getClass());
			System.out.println(wechatUser);
			super.session.setAttribute("weChatUser", wechatUser);
		}
	}
	
}
