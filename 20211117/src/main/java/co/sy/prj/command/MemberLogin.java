package co.sy.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sy.prj.comm.Command;
import co.sy.prj.member.service.MemberService;
import co.sy.prj.member.service.MemberVO;
import co.sy.prj.member.serviceImpl.MemberServiceImpl;

public class MemberLogin implements Command {
	private String message;
	
	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		/* 로그인 하기 위해서는 DB와 연결이 되어야 한다. 따라서, Model을 호출해서 결과를 처리해야 한다.
		 * */
		HttpSession session = request.getSession();
		MemberService memberDAO = new MemberServiceImpl();
		MemberVO member = new MemberVO();
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member = memberDAO.memberSelect(member);
		
		if(member != null) {
			session.setAttribute("id", member.getId());
			session.setAttribute("author", member.getAuthor());
			session.setAttribute("name", member.getName());
			message = member.getName() + "님 환영합니다."; 
		} else {
			message = "아이디 또는 비밀번호를 확인하세요.";
		}
		
		request.setAttribute("message", message);
		return "member/memberLogin";
	}

}
