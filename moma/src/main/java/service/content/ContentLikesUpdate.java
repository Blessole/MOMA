package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LikesDao;
import dao.ReviewDao;
import model.Likes;
import service.CommandProcess;

public class ContentLikesUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ContentLikesUpdate 자바파일 지나감");
		int cno = Integer.parseInt(request.getParameter("cno"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		
		// 회원이 해당 컨텐츠를 좋아요 했는지 체크
		LikesDao ld = LikesDao.getInstance();
		Likes lk = ld.select(cno, mno);
		String imgSrc = "";
				
		if (lk == null) { // 좋아요
			ld.insert(cno, mno);
			imgSrc = "/moma/img/icon/heart (1).png";
		} else { // 좋아요 취소
			ld.delete(cno, mno);
			imgSrc = "/moma/img/icon/heart.png";
		}
		System.out.println("contentlikeupdate 자바 파일 지나감");
		request.setAttribute("imgSrc", imgSrc);
		
		return "contentLikesUpdate";
	}

}