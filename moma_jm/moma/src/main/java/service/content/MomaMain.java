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
		
		
		List<Content> dlist = cd.topDlist();
		request.setAttribute("dlist", dlist);
		
		List<Content> mlist = cd.topMlist();
		request.setAttribute("mlist", mlist);
		
		return "momaMain";
	}
}
