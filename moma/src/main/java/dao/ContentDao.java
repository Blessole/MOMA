package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Content;

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
	
	// 컨텐츠 상세 select
	public Content select(int cno) {
		return (Content) session.selectOne("contentns.selectView", cno);
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
	public List<Content> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectList", hm);
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
	
	
}
