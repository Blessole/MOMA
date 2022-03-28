package dao;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	private static MemberDao getInstance() {
		return instance;
	}
}
