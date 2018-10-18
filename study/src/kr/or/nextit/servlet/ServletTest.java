package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(name="servletTest", urlPatterns= {"/servletTest"})
public class ServletTest extends HttpServlet {

	@Override
	protected void doGet(
			HttpServletRequest req, 
			HttpServletResponse resp
	) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out =  resp.getWriter();
		out.println("===== doGet : Test =====<br>");
		out.println(req.getParameter("test"));
		out.println(req.getParameter("userName"));
		
	}
	
	@Override
	protected void doPost(
			HttpServletRequest req, 
			HttpServletResponse resp
			) throws ServletException, IOException {
 
		
		Enumeration<String> params = req.getParameterNames();
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out =  resp.getWriter();
		out.println("===== doPost : Test ===== <br>");
		while (params.hasMoreElements()) {
			String param = (String) params.nextElement();
			out.println(
				String.format("parma Name : %s = value : %s <br>", 
						param,
						req.getParameter(param)
						)
					);
		}
		
		//req.getRequestDispatcher("/index.jsp").forward(req, resp);
		
		
	}
	
}
