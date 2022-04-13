package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import model.Content;
import service.CommandProcess;

public class AdContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		ContentDao cd = ContentDao.getInstance();
		List<Content> list = cd.list();

		request.setAttribute("list", list);
		
		return "adContent";
	}

}
