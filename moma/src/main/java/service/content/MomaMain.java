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
		System.out.println("MomaMain 자바파일 거쳤음");
		
		ContentDao cd = ContentDao.getInstance();
		
		
		List<Content> list = cd.list();
		request.setAttribute("list", list);
		
		return "momaMain";
	}
}
