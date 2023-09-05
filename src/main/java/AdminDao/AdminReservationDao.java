package AdminDao;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import AdminController.AdminMemberController;
import Vo.MemberVo;
import Vo.ReservationVo;
import utill.MyBatisCommonFactory;

public class AdminReservationDao
{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	private static SqlSessionFactory sqlSessionFactory;

	public AdminReservationDao()
	{// 파라미터가 없는 생성자를 디폴트 생성자라고 한다.
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}


	public List<Map<String, Object>> reservationList()
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> rlist = session.selectList("reservationList");
		session.close();
		return rlist;
	}


	public List<Map<String, Object>> reservationListSearch(String mem_name)
	{
		logger.info("조회검색");
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> rlist = session.selectList("reservationListSearch",mem_name);
		session.close();
		return rlist;
	}


	public Map<String, Object> reservationDetail(int res_no)
	{
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> rmap = session.selectOne("reservationDetail", res_no);
		session.close();
		return rmap;
	}


	public int reservationDelete(int res_no)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.delete("reservationDelete", res_no);
		session.commit();
		session.close();
		return result;
	}

}
