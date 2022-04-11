package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LikesDao;
import model.Likes;
import service.CommandProcess;

public class ContentLikesUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		// 회원이 해당 컨텐츠를 좋아요 했는지 체크
		LikesDao lkd = LikesDao.getInstance();
		Likes lk = lkd.select(cno, mno);
		String color = "";
		
		if (lk == null) { // 좋아요
			lkd.insert(cno, mno);
			color = "var(--point-color)";
		} else { // 좋아요 취소
			lkd.delete(cno, mno);
			color = "none";
		}
		
		request.setAttribute("color", color);
		
		return "contentLikesUpdate";
	}

}