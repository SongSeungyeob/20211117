package co.sy.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.sy.prj.comm.Command;

public class Logout implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		/* Session Interface를 불러와서 Session을 Remove 시켜버리면 된다. */
		HttpSession session = request.getSession();
		session.invalidate();
		return "home.do";
	}

}
