package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.ContentDao;
import model.Board;
import model.Content;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String srch = request.getParameter("srch");
		
		ContentDao cd = ContentDao.getInstance();
		List<Content> ctList = cd.search(srch);
		
		BoardDao bd = BoardDao.getInstance();
		List<Board> bdList = bd.search(srch);
		
		request.setAttribute("ctList", ctList);
		request.setAttribute("bdList", bdList);
	
		return "searchAction";
	}

}
