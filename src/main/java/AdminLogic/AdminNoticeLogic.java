package AdminLogic;

import java.util.List;

import AdminDao.AdminNoticeDao;
import Vo.MemberVo;
import Vo.NoticeVo;

public class AdminNoticeLogic
{

	AdminNoticeDao adminNoticeDao = new AdminNoticeDao();

	public List<NoticeVo> noticeList()
	{
		List<NoticeVo> nlist = adminNoticeDao.noticeList();
		return nlist;
	}


	public List<NoticeVo> noticeListSearch(String notice_title)
	{
		List<NoticeVo> nlist = adminNoticeDao.noticeListSearch(notice_title);
		return nlist;
	}


	public NoticeVo noticeDetail(String notice_title)
	{
		NoticeVo noticeVo = adminNoticeDao.noticeDetail(notice_title);
		return noticeVo;
	}


	public int noticeInsert(NoticeVo noticeVo)
	{

		int result = adminNoticeDao.noticeInsert(noticeVo);
		return result;
	}


	public int noticeDelete(int notice_no)
	{
		int result = adminNoticeDao.noticeDelete(notice_no);
		return result;
	}

}
