package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reservation;

public class ReservationDao {
	// singleton
	private static ReservationDao instance = new ReservationDao();
	private ReservationDao() {}
	public static ReservationDao getInstance() {
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
	public int insert(Reservation reserve) {
		return session.insert("reservationns.insert", reserve);
	}
	
	public int delete(int cno) {
		return session.delete("reservationns.delete", cno);
	}
	
	public List<Reservation> myMain(int mno) {
		/* return session.selectList("reservationns.list", mno); */
		return null;
	}
	
}