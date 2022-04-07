package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentDao;
import dao.MemberDao;
import model.Content;
import model.Member;
import service.CommandProcess;

public class ReserveForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ReserveForm 자바파일 지나감!");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		ContentDao cd = ContentDao.getInstance();
		Content content = cd.select(cno);
		
		// session mno로 회원 정보 조회하기
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mno);
		
		request.setAttribute("cno", cno);
		request.setAttribute("content", content);
		request.setAttribute("member", member);
		
		System.out.println("ReserveForm 자바파일 지나감!2");
		
		return "reserveForm";
	}

}
