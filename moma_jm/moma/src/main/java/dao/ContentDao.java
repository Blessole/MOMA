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
			System.out.println("ContentDao 지나간다~~ 왔냐?");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// cname 중복 체크
	public Content select(String cname) {
		return (Content) session.selectOne("contentns.select", cname);
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

/*
	// 컨텐츠 리스트 통합 조회
	public List<Content> list() {
		return (List<Content>)session.selectList("contentns.selectList");
	}
*/
	
	// 컨텐츠 드라마 TOP10 리스트 통합 조회
	public List<Content> topDlist() {
		return (List<Content>)session.selectList("contentns.selectDTopList");
	}
	
	// 컨텐츠 영화 TOP10 리스트 통합 조회 
	public List<Content> topMlist() { 
		return (List<Content>)session.selectList("contentns.selectMTopList"); 
	}
	
	// 컨텐츠 드라마 리스트 통합 조회
	public List<Content> Dlist(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectDList", hm);
	}

	// 컨텐츠 영화 리스트 통합 조회
	public List<Content> Mlist(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Content>)session.selectList("contentns.selectMList", hm);
	}

	// Genre total
	public int getTotalGenre(String[] genre) {
		return (int) session.selectOne("contentns.getTotalGenre", genre);
	}
	
	// 장르태그로 리스트 조회
	public List<Content> listGenre(String[] genre, int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("genre", genre);
		return session.selectList("contentns.selectGenre", hm);
	}
	
	/*
	 * public Content select(String cname) { return null; }
	 */
	public List<Content> myMain(int mno) {
		// TODO Auto-generated method stub
		return null;
	}
}