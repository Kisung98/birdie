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
import Vo.NoticeVo;
import utill.MyBatisCommonFactory;

public class AdminNoticeDao
{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	private static SqlSessionFactory sqlSessionFactory;

	public AdminNoticeDao()
	{
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}


	public List<NoticeVo> noticeList()
	{
		logger.info("memberList");
		SqlSession session = sqlSessionFactory.openSession();
		List<NoticeVo> nlist = session.selectList("noticeList");
		session.close();
		return nlist;
	}


	public List<NoticeVo> noticeListSearch(String notice_title)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<NoticeVo> mlist = session.selectList("noticeListSearch", notice_title);
		session.close();
		return mlist;
	}


	public NoticeVo noticeDetail(String notice_title)
	{
		SqlSession session = sqlSessionFactory.openSession();
		NoticeVo noticeVo = new NoticeVo();
		noticeVo = session.selectOne("noticeListSearch", notice_title);
		session.close();
		return noticeVo;
	}


	public int noticeInsert(NoticeVo noticeVo)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.insert("noticeInsert", noticeVo);
		session.commit();
		session.close();
		return result;
	}


	public int noticeDelete(int notice_no)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.delete("noticeDelete", notice_no);
		session.commit();
		session.close();
		return result;
	}

}
