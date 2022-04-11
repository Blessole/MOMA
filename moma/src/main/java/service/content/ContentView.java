package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentDao;
import dao.LikesDao;
import dao.ReviewDao;
import model.Content;
import model.Likes;
import model.Review;
import service.CommandProcess;

public class ContentView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));

		ContentDao cd = ContentDao.getInstance();
		Content content = cd.select(cno);
		
		// 리뷰 페이징 : start
		final int ROW_PER_PAGE = 4; // 한 페이지에 10개씩

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
 
		// 뿌려질 리스트의 시작번호 
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호
		int endRow = startRow + ROW_PER_PAGE - 1;
		
		// 해당 전시 컨텐츠 리스트 셀렉
		ReviewDao rd = ReviewDao.getInstance();
		List<Review> list = rd.select(cno, startRow, endRow);
		
		// 해당 컨텐츠의 총 리뷰 수
		int total = rd.getTotal(cno);
		
		// 총 페이지 수
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE);

		// 평균 별점
		float star_rate = 0;

		// 리뷰가 없을때 제어
		if (list.size() == 0) {
			star_rate = 0;
		} else {
			star_rate = (float) rd.selectStar(cno);
		}

		// 리뷰 갯수
		int reviewCnt = total; //list.size();
		
		// 회원이 좋아요 했는지 체크
		LikesDao lkd = LikesDao.getInstance();
		HttpSession session = request.getSession();
		String color = "";
		
		if (session.getAttribute("mno") != null) {
			int mno = (int) session.getAttribute("mno");
			Likes lk = lkd.select(cno, mno);
			
			if (lk == null) {
				color = "none";
			} else {
				color = "var(--point-color)";
			}
		} else {
			color = "none";
		}
		
		request.setAttribute("cno", cno);
		request.setAttribute("content", content);
		request.setAttribute("list", list);
		request.setAttribute("star_rate", star_rate);
		request.setAttribute("reviewCnt", reviewCnt);
		request.setAttribute("color", color);
		
		request.setAttribute("pageNum", pageNum);	
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);

		return "contentView";
	}

}