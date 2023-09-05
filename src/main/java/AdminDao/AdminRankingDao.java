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

public class AdminRankingDao
{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	private static SqlSessionFactory sqlSessionFactory;

	public AdminRankingDao()
	{// 파라미터가 없는 생성자를 디폴트 생성자라고 한다.
		logger.info("생성자 호출");
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}


	public List<Map<String, Object>> rankingList()
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<Map<String, Object>> rlist = session.selectList("rankingList");
		session.close();
		return rlist;
	}

}
