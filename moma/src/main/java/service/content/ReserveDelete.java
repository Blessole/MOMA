package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import service.CommandProcess;

public class ReserveDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		ReservationDao rd = ReservationDao.getInstance();
		int result = rd.delete(cno);
		
		request.setAttribute("result", result);
		
		return "reserveDelete";
	}

}
