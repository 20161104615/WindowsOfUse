package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LoginFilter implements Filter {
	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		// 获得用户请求的URI
		String path = req.getRequestURI();
		String loginName = (String) session.getAttribute("loginName");
		String loginPassword = (String) session.getAttribute("loginPassword");
		
		
		if (path.indexOf("../login.jsp") > -1) {
			// 放行
			chain.doFilter(request, response);
			return;
		} else {// 如果不是login.jsp进行过滤
			if (loginPassword == null || loginName == null) {// 跳转到登陆页面
				resp.sendRedirect("../login.jsp");
			} else {
				// 已经登陆,继续此次请求
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}