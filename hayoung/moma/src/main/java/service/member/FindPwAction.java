package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class FindPwAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		int result = 0; // result는 기본 0. id는 있는데 email은 다를 때.
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		
		if (member == null || member.getDel().equals("y")) result = -1;
		// 얘는 없는 아이디이거나	del=y 삭제된 아이디일 때
		
		else {
		if (member.getEmail().equals(email)) { 
			result = 1; // id, email 정확할 때 
			}
		}
		
		request.setAttribute("member", member);
		request.setAttribute("result", result);
		return "findPwAction";
	}
}
