package model;

import java.sql.Date;

public class Comment {
	
	private int bcno;
	private String bc_content;
	private Date bc_date;
	private String del;
	private int bno;
	private int mno;
	
	public int getBcno() {
		return bcno;
	}
	public void setBcno(int bcno) {
		this.bcno = bcno;
	}
	public String getBc_content() {
		return bc_content;
	}
	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}
	public Date getBc_date() {
		return bc_date;
	}
	public void setBc_date(Date bc_date) {
		this.bc_date = bc_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
}
