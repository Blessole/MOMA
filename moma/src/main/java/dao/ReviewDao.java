package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;
import model.Reservation;
import model.Review;

public class ReviewDao {

	// singleton
		private static ReviewDao instance = new ReviewDao();
		private ReviewDao() {}
		public static ReviewDao getInstance() {
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
	
	// 마이페이지 : 리뷰내역 조회
	public List<Review> myList(int mno, int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("reviewns.myList", hm);
	}
		
	// 마이페이지 : 나의 총 리뷰 수
	public int getTotalMy(int mno) {
	    return (int) session.selectOne("reviewns.getTotalMy", mno);
	}
	
	// 마이페이지 : 리뷰 삭제
	public int delete(int rvno) {
		return  session.delete("reviewns.delete", rvno);
	}
	
	// 마이페이지 리뷰 수정 : review.* 와 content.cname 조회
	public Review selectRvno(int rvno) {
		return (Review) session.selectOne("reviewns.selectRvno", rvno);
	}
	
	// 마이페이지 리뷰 수정 : update action (content)
	public int update(Review review) {
		return session.update("reviewns.update", review);
	}
	
	
}
