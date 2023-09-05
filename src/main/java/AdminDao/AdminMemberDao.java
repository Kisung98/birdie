package AdminDao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import AdminController.AdminMemberController;
import Vo.MemberVo;
import utill.MyBatisCommonFactory;

public class AdminMemberDao
{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	private static SqlSessionFactory sqlSessionFactory;

	public AdminMemberDao()
	{
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}


	public List<MemberVo> memberList()
	{
		logger.info("memberList");
		SqlSession session = sqlSessionFactory.openSession();
		List<MemberVo> mlist = session.selectList("memberList");
		session.close();
		return mlist;
	}


	public List<MemberVo> memberListSearch(String mem_name)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<MemberVo> mlist = session.selectList("memberListSearch", mem_name);
		session.close();
		return mlist;
	}


	public int memberInsert(MemberVo memberVo)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.insert("memberInsert", memberVo);
		session.commit();
		session.close();
		return result;
	}

}
