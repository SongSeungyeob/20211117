package co.sy.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sy.prj.comm.Command;
import co.sy.prj.member.service.MemberService;
import co.sy.prj.member.service.MemberVO;
import co.sy.prj.member.serviceImpl.MemberServiceImpl;

public class MemberIdCheck implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("chkid"));
		boolean ret = memberDao.memberIdCheck(vo); // return true : ID가 이미 존재한다. return false : ID가 존재하지 않으므로 사용 가능하다.
		String chk = "0";
		if(ret) {
			chk = "1";
		} 
		//request.setAttribute("idCheck", ret);
		//memberIdCheck
		return "ajax:" + chk;
	}

}
