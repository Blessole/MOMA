package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Content;
import model.Reservation;

public class ContentDao {
	//singleton
	private static ContentDao instance = new ContentDao();
	private ContentDao() {}
	public static ContentDao getInstance() {
		return instance;
	}
	
	// mybatis
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 컨텐츠 정보 cno로 조회
	public Content selectCno(int cno) {
		return (Content) session.selectOne("contentns.selectCno", cno);
	}
	
	// 검색
	public List<Content> search(String srch) {
		return session.selectList("contentns.search", srch);
	}
	
	// content paging total
	public int getTotalC() {
		return (int) session.selectOne("contentns.getTotalC");
	}
	
	// 컨텐츠 리스트 통합 조회
	public List<Content> list() {
		return (List<Content>)session.selectList("contentns.selectList");
	}
	
	// tag total
	public int getTotalTag(String[] tag) {
		return (int) session.selectOne("contentns.getTotalTag", tag);
	}
	
	// 태그로 리스트 조회
	public List<Content> listTag(String[] tag, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("tag", tag);
		return session.selectList("contentns.selectTag", hm);
	}
	
	// 내가 예매한 컨텐츠의 정보 조회
	public Content selectCno(List<Reservation> rs_cno) {
		return (Content) session.selectOne("contentns.selectCno", rs_cno);
	}
	
	// 마이페이지 - reservation에서 보여줄 cname 
	public List<Content> rs_cname(int mno) {
		return (List<Content>) session.selectList("contentns.rs_cname", mno);
	}
	
	// 마이페이지 - review에서 보여줄 cname 
	public Content selectRvno(int rvno) {
		return (Content) session.selectOne("contentns.selectRvno", rvno);
	}
	
}