package service.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class MomaMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		ContentDao cd = ContentDao.getInstance();
		int cno = Integer.parseInt(request.getParameter("cno"));
		String cname = (String) request.getParameter("cname");
		Content content = cd.select(cno);
		
		/*
		 * String tag[] = request.getParameterValues("genre"); // 태그별
		 */		
		System.out.println("MomaMain 자바파일 거쳤음");
		

		List<Content> list = cd.list();
		System.out.println(list);
		
		request.setAttribute("content", content);
		request.getAttribute("content");
		request.setAttribute("list", list);
		return "momaMain";
		}
	}

