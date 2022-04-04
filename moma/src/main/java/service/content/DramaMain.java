package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class DramaMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		System.out.println("DramaMain 자바파일임");
		// ct 리스트 조회
		ContentDao cd = ContentDao.getInstance();
		String tag[] = request.getParameterValues("genre"); // 태그별
		
		List<Content> list = cd.list();
		String cname = (String)session.getAttribute("cname");
		
		Content ct = (Content) cd.list();
		request.setAttribute("content", ct);
		
		System.out.println("DramaMain 자바파일임");
		System.out.println(list);
		
		request.setAttribute("cname", cname);
		
		/*
		 * // paging : start final int ROW_PER_PAGE = 10; // 한 페이지에 10개씩 final int
		 * PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지
		 * 
		 * String pageNum = request.getParameter("pageNum"); if (pageNum == null ||
		 * pageNum.equals("")) { pageNum = "1"; }
		 * 
		 * // 현재 페이지 int currentPage = Integer.parseInt(pageNum);
		 * 
		 * // 총 갯수 int total = cd.getTotalC();
		 * 
		 * // 시작번호 : (페이지번호 - 1) * 페이지당 갯수 + 1 int startRow = (currentPage - 1) *
		 * ROW_PER_PAGE + 1; // 끝번호 : 시작번호 + 페이지당개수 - 1 int endRow = startRow +
		 * ROW_PER_PAGE - 1;
		 * 
		 * // 페이징 리스트로 기존 리스트 수정(전체 리스트) 
		 * List<Content> list = cd.list(startRow, endRow);
		 * 
		 * // 태그만 조회 List<Content> listTag = null; if (tag != null) { listTag =
		 * cd.listTag(tag, startRow, endRow); total = cd.getTotalTag(tag); }
		 * 
		 * // Math.ceil : 현재 실수보다 큰 정수 int totalPage =
		 * (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수 // 시작페이지 : 현재페이지 -
		 * (현재페이지 - 1) % 10 int startPage = currentPage - (currentPage - 1) %
		 * PAGE_PER_BLOCK; // 끝페이지 : 시작페이지 + 블록당페이지 수 -1 int endPage = startPage +
		 * PAGE_PER_BLOCK - 1; // 총 페이지보다 큰 endPage는 나올 수 없다. if (endPage > totalPage)
		 * endPage = totalPage; // paging : end
		 * 
		 * 
		 * request.setAttribute("list", list); request.setAttribute("listTag", listTag);
		 * 
		 * // paging param request.setAttribute("pageNum", pageNum);
		 * request.setAttribute("currentPage", currentPage);
		 * request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		 * request.setAttribute("startPage", startPage); request.setAttribute("endPage",
		 * endPage); request.setAttribute("totalPage", totalPage);
		 */	
		return "dramaMain";
	}

}
