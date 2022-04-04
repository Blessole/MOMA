package service.content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContentDao;
import dao.ReservationDao;
import model.Content;
import model.Reservation;
import service.CommandProcess;

public class ReserveAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		int rsnum = 0;
		
		ContentDao cd = ContentDao.getInstance();
		Content ct = cd.select(cno);
		if (request.getParameter("rsnum") != null) {
			rsnum = Integer.parseInt(request.getParameter("rsnum"));
		}
		
		Reservation reserve = new Reservation();
		reserve.setCno(cno);
		reserve.setMno(mno);
		reserve.setRsnum(rsnum);
		
		ReservationDao rv = ReservationDao.getInstance();
		int result = rv.insert(reserve);
		
		request.setAttribute("result", result);
		return "reserveAction";
	}

}
