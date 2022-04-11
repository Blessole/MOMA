package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	 
	public static MemberDao getInstance() {
		return instance;
	}

	private static SqlSession session;
		static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
				reader.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// moma FindPwAction, 세모전 joinResult, IdConfirm, LoginResult
		public Member select(String id) {
			return (Member) session.selectOne("memberns.select", id);
		}
		
		// moma confirmNickname
		public Member confirmNickname(String nickname) {
			return (Member) session.selectOne("memberns.confirmNickname", nickname);
		}
		
		// moma id로 회원정보 조회
		public int selectMno(String id) {
			return (int) session.selectOne("memberns.selectMno", id);
		}
		
		// moma email로 회원정보 조회
		public Member selectEmail(String email) {
			return (Member) session.selectOne("memberns.selectEmail", email);
		}
		
		// moma joinAction(insert)
		public int insert(Member member) {			
			return session.insert("memberns.insert", member);
		}
		
		// moma FindIdAction
		public Member findId(String mname, String email) {
			// Hash맵을 만들어서 name과 email을 넣자.
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("mname", mname);
			hm.put("email", email);
			// session.selectOne 메서드를 이용하여 쿼리문에 해당하는 id 값을 가져옴
			// 이때 xml에서 해당 id에 대한 resultType의 데이터형이 서로 같아야합니다.
			return (Member) session.selectOne("memberns.findId", hm);
		}
		
		// moma FindPwAction
		public Member findPassword(String id, String email) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("id", id);
			hm.put("email", email);
			return (Member) session.selectOne("memberns.findPassword", hm);
		}
		
		// moma update
		public int update(Member member) {
			return session.update("memberns.update", member);
		}

		// moma mno로 회원정보 조회
		public Member selectByMno(int mno) {
			return (Member) session.selectOne("memberns.selectByMno", mno);
		}
		

		/*
		 * // 세모전 Delete public int delete(int mno) { return
		 * session.update("memberns.delete", mno); }
		 * 
		 * // 세모전 AdminMember - 전체 회원정보 조회 public List<Member> list(int startRow, int
		 * endRow) { HashMap<String, Integer> hm = new HashMap<>(); hm.put("startRow",
		 * startRow); hm.put("endRow", endRow); return
		 * (List<Member>)session.selectList("memberns.list",hm); }
		 * 
		 * // 세모전 AdminMember - 총 회원수 public int getTotal() { return (int)
		 * session.selectOne("memberns.getTotal"); }
		 * 
		 * // 세모전 다른 테이블에서 회원번호를 활용한 닉네임 찾기 public String selectNick(int mno) { return
		 * (String) session.selectOne("memberns.selectNick", mno); }
		 * 
		 * // 세모전 다른 테이블에서 세션 아이디를 활용한 회원번호 찾기 public int selectMno(String id) { return
		 * (int) session.selectOne("memberns.selectMno", id); }
		 * 
		 * // 세모전 mno로 회원 정보 조회 public Member select(int mno) { return (Member)
		 * session.selectOne("memberns.selectReserve", mno); }
		 * 
		 * // 세모전 adminFindMember 관리자계정으로 member 검색 public List<Member>
		 * searchMember(String searchKey, String searchValue) { HashMap<String, String>
		 * hm = new HashMap<>(); hm.put("searchKey", searchKey); hm.put("searchValue",
		 * searchValue); return
		 * (List<Member>)session.selectList("memberns.searchMember",hm); }
		 */
}
