package AdminDao;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import Vo.NoticeVo;
import Vo.QnaVo;
import utill.MyBatisCommonFactory;

public class AdminQnaDao
{

	private static SqlSessionFactory sqlSessionFactory;

	public AdminQnaDao()
	{
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}

	
	
	public List<QnaVo> qnaList()
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<QnaVo> list = session.selectList("qnaSelect");
		session.close();
		return list;
	}


	public List<QnaVo> qnaListSearch(String qna_title)
	{
		SqlSession session = sqlSessionFactory.openSession();
		List<QnaVo> qlist = session.selectList("qnaListSearch", qna_title);
		session.close();
		return qlist;
	}


	public QnaVo qnaDetail(String qna_title)
	{
		SqlSession session = sqlSessionFactory.openSession();
		QnaVo qnaVo = session.selectOne("qnaListSearch",qna_title);
		session.close();
		return qnaVo;
	}


	public int qnaAnswer(QnaVo qnaVo)
	{
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.update("qnaAnswer", qnaVo);
		session.commit();
		session.close();
		return result;
	}

}
