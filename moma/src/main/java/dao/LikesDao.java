package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Content;
import model.Member;
import model.Likes;

public class LikesDao {
	private static LikesDao instance = new LikesDao();

	private LikesDao() {
	}

	public static LikesDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
//			openSession(true) : 입력/삭제/수정 후에 commit
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 마이페이지 - 좋아요 한 수
	 public int getTotalMy(int mno) { 
		 return (int) session.selectOne("likesns.getTotalMy", mno); }

	// 마이페이지 - 좋아요  조회
	public List<Likes> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("mno",mno);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return	session.selectList("likesns.myList", hm); }
	 
}
	
	
	
	
