package service.myPage;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReviewDao;
import model.Member;
import model.Review;
import service.CommandProcess;

public class MyReviewUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String prevUrl = request.getParameter("prevUrl");
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		
		String rv_content = request.getParameter("rv_content");
		int star_rate = Integer.parseInt(request.getParameter("star_rate"));
		
		ReviewDao rd = ReviewDao.getInstance();
		Review review = new Review();
		review.setRv_content(rv_content);
		review.setStar_rate(star_rate);
		
		int result = rd.update(review);
		
		request.setAttribute("result", result);
		request.setAttribute("rvno", rvno);
		
		return "myReviewUpdateAction";
	}
}