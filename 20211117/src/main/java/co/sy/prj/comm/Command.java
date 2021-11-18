package co.sy.prj.comm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// View Page를 return 해주기 위한 Interface.
	// View Page를 return 해줘야 하므로, String 객체로 return,.
	public String run(HttpServletRequest request, HttpServletResponse response);
}
