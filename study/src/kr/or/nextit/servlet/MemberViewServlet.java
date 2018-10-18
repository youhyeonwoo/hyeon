package kr.or.nextit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.nextit.member.service.MemberService;
import kr.or.nextit.member.service.MemberVo;
import kr.or.nextit.member.service.impl.MemberServiceImpl;

@WebServlet(name="MemberViewServlet" , 
			urlPatterns= {"/memeberView.next"})
public class MemberViewServlet extends HttpServlet {

	private MemberService memberService;

	@Override
	public void init() throws ServletException {

		memberService  =  new MemberServiceImpl();
		
		super.init();
	}
	
	@Override
	protected void service(
			HttpServletRequest req, 
			HttpServletResponse resp
		) throws ServletException, IOException {
		
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("회원 정보 출력~~");
		 
//		MemberVo memberVo = new MemberVo();
//		try {
//		 List<MemberVo> memberList = 
//				 memberService.getMemberList(memberVo);
//		 req.setAttribute("memberList", memberList);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String userId = req.getParameter("userId");
		
		try {
			MemberVo memberResult = memberService.getMemberItem(userId);
			req.setAttribute("memberInfo", memberResult);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(e.getMessage());
			throw new ServletException(e.getMessage(), e);
			//throw new IOException(e.getMessage(), e);
		}
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/17/memberViewServlet.jsp");
		dispatcher.forward(req, resp);
		
		
		
	}
}
