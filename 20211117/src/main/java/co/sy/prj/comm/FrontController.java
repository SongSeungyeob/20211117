package co.sy.prj.comm;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.sy.prj.command.HomeCommand;
import co.sy.prj.command.Logout;
import co.sy.prj.command.MemberDelete;
import co.sy.prj.command.MemberIdCheck;
import co.sy.prj.command.MemberInfo;
import co.sy.prj.command.MemberList;
import co.sy.prj.command.MemberLogin;
import co.sy.prj.command.MemberLoginForm;
import co.sy.prj.command.MemberUpdate;
import co.sy.prj.command.MemberEditSave;
import co.sy.prj.command.MemberJoin;
import co.sy.prj.command.MemberJoinForm;

@WebServlet("*.do")	// ~~.do 에 해당하는 모든 호출을 FrontController인 내가 받겠다. (* = 전부를 의미)
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<>();

	public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		/* Command들을 요청에 따라 처리할 수 있도록 메모리에 구성한다.
		 * map에다가 <호출할 URL명 , Command > 형태로 삽입.
		 */
		System.out.println("3");
		map.put("/home.do", new HomeCommand());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/logout.do", new Logout());
		map.put("/memberList.do", new MemberList());
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/ajaxIdCheck.do", new MemberIdCheck());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/memberInfo.do", new MemberInfo());
		map.put("/memberUpdate.do", new MemberUpdate());
		map.put("/memberEditSave.do", new MemberEditSave());
		map.put("/memberDelete.do", new MemberDelete());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 요청을 분석하고 실행할 Command를 찾아 수행하고 결과를 돌려주는 Method.
		 */
		System.out.println("2");
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();	// Domain Name을 제외한 ContextPath로 부터의 나머지가 URI.
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());
		System.out.println("URI = " + uri + " , contextPath = " + contextPath + " , page = " + page);
		/* URI = 20211117/home.do
		 * contextPath = 20211117
		 * page = /home.do
		 * */
		Command command = map.get(page);
		String viewPage = command.run(request, response);
		System.out.println("viewPage = " + viewPage);
		
		if(!viewPage.endsWith(".do")) {
			if(viewPage.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			} else {
				viewPage = "WEB-INF/views/" + viewPage + ".jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		/*
		 * Class RequestDispatcher 
		 * - 현재 Request에 담긴 정보를 저장하고 있다가 그 다음 Page에서도 해당 정보를 계속해서
		 *   볼 수 있게 저장하는 기능이다. 
		 * - dispatch는 일반적으로 forward() 의 기능을 가지고 있고 해당 method도 가지고 있다.
		 */
	}

}
