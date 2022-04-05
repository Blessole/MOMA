package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class MovieMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("movieMain 자바파일 지나간당");
		
		// ct 리스트 조회
		ContentDao cd = ContentDao.getInstance();
		String sort = (String) request.getAttribute("sort");
		Content content = cd.select(sort);
		
		List<Content> list = cd.Mlist();
		
		request.setAttribute("content", content);
		request.setAttribute("list", list);
		
		return "movieMain";
	}

}
