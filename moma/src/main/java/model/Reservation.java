package model;

import java.sql.Date;

public class Reservation {
	private int rs_no;
	private Date rsdate;
	private String rstime;
	private int rsnum;
	private String cinema;
	private String payment;
	private String del;
	private int price;
	private int mno;
	private int cno;
	
	// 컨텐츠꺼 불러올꺼라서. getter,setter필요함.
	private String cname;
	private String poster;
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	//
	
	public int getRs_no() {
		return rs_no;
	}
	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
	}
	public Date getRsdate() {
		return rsdate;
	}
	public void setRsdate(Date rsdate) {
		this.rsdate = rsdate;
	}
	public String getRstime() {
		return rstime;
	}
	public void setRstime(String rstime) {
		this.rstime = rstime;
	}
	public int getRsnum() {
		return rsnum;
	}
	public void setRsnum(int rsnum) {
		this.rsnum = rsnum;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	
	
}