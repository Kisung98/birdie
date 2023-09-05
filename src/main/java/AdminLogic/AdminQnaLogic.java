package AdminLogic;

import java.util.List;

import AdminDao.AdminQnaDao;
import Vo.QnaVo;

public class AdminQnaLogic
{

	AdminQnaDao adminQnaDao = new AdminQnaDao();

	public List<QnaVo> qnaList()
	{
		List<QnaVo> qlist = adminQnaDao.qnaList();
		return qlist;
	}


	public List<QnaVo> qnaListSearch(String qna_title)
	{
		List<QnaVo> qlist = adminQnaDao.qnaListSearch(qna_title);
		return qlist;
	}


	public QnaVo qnaDetail(String qna_title)
	{
		QnaVo qnaVo = adminQnaDao.qnaDetail(qna_title);
		return qnaVo;
	}


	public int qnaAnswer(QnaVo qnaVo)
	{
		int result = adminQnaDao.qnaAnswer(qnaVo);
		return result;
	}

}
