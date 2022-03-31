package dao;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	public static MemberDao getInstance() {
		return instance;
	}
	public Member select(int mno) {
		// TODO Auto-generated method stub
		return null;
	}
}
