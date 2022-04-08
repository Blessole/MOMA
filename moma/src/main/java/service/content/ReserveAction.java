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
		System.out.println("ReserveAction 자바파일 지나감");
		int cno = Integer.parseInt(request.getParameter("cno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		String rstime = request.getParameter("rstime");
		int rsnum = Integer.parseInt(request.getParameter("rsnum"));
		String rsdate = request.getParameter("rsdate");
		String cinema = request.getParameter("cinema");
		
		ContentDao cd = ContentDao.getInstance();
		Content ct = cd.select(cno);
		
		Reservation reserve = new Reservation();
		reserve.setCno(cno);
		reserve.setMno(mno);
		reserve.setRsnum(rsnum);
		
		ReservationDao rv = ReservationDao.getInstance();
		int result = rv.insert(reserve);
		
		System.out.println("ReserveAction 자바파일 지나감22");
		request.setAttribute("result", result);
		return "reserveAction";
	}

}
