package kr.or.nextit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="GuguDan", urlPatterns= {"/guguDan.test"})
public class GuGuDanServlet extends HttpServlet {

@Override
public void service(
		HttpServletRequest req, 
		HttpServletResponse res
	) throws ServletException, IOException {

	res.setContentType("text/html");
	res.setCharacterEncoding("utf-8");
	PrintWriter out = res.getWriter();
	out.println("<html>");
	out.println("<head>");
	out.println("<title>구구단</title>");
	out.println("</head>");
	out.println("<body>");
	out.println("<h1>구구단 출력 (1단 9)</h1>");
	out.println("<table border=\"5\">");

	String flag = req.getParameter("flag");
	out.println(
	  ("left".equals(flag) ? "<tr style=\"text-align: center;\"> " : "")
	);
	for (int dan = 1; dan < 10; dan++) {
		if ("left".equals(flag)) { out.println(" <td>"); } 
		else {
			out.println("<tr style=\"text-align: center;\"> \n <td>");
		}
		for (int i = 1; i < 10; i++) {
			out.printf(" %d * %d = %d <br> \n", dan, i, (dan * i));
		}
		out.println(
			("left".equals(flag) ? "</td> \n" : " </td> \n</tr>  \n")
		);
	}
	out.println( ("left".equals(flag) ? "</tr> \n" : "") );
	out.println("</table>");
	
	
	out.println("</body>");
	out.println("</html>");

}


}







