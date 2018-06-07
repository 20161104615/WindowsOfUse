package cn.edu.imnu.WebHomework.OnlineUser;

import java.io.*;
import javax.servlet.*;

public class FilterIP {
	protected FilterConfig filterconfig;

	protected String FilteredIP;// 被过滤的IP

	// 过滤器初始化
	public void init(FilterConfig conf) throws ServletException {
		this.filterconfig = conf;
		// 获取被过滤的IP
		FilteredIP = conf.getInitParameter(FilteredIP);
		if (FilteredIP == null) {
			FilteredIP = "";
		}
	}

	// 过滤操作
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//定义错误转向页面
		RequestDispatcher dispatcher = request.getRequestDispatcher("ErrorInfo.jsp");
		
		//读出本地 IP，将其与要过滤掉的IP比较，如果相同，就转移到错误处理页面
		String remoteIP = request.getRemoteAddr();
		
		if (remoteIP.equals(FilteredIP)){
			dispatcher.forward(request, response);
			return;
		}
		else{
			//将请求转发给过滤链上的其他对象
			chain.doFilter(request, response);
		}
	}
	
	//销毁操作
	public void destroy(){
		this.filterconfig = null;
	}
}