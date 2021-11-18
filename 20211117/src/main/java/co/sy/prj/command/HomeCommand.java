package co.sy.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sy.prj.comm.Command;

public class HomeCommand implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		/* 단순히 처음 들어오는 Home Page를 열어주는 역할.
		 * */
		return "home/home";
	}

}
