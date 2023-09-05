package AdminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import AdminDao.AdminMemberDao;
import AdminDao.AdminNoticeDao;
import AdminLogic.AdminMemberLogic;
import AdminLogic.AdminNoticeLogic;
import Vo.MemberVo;
import Vo.NoticeVo;

@WebServlet("*.notice")
public class AdminNoticeController extends HttpServlet
{
	Logger logger = Logger.getLogger(AdminNoticeController.class);
	private static final long serialVersionUID = 1L;
	AdminNoticeLogic adminNoticeLogic = new AdminNoticeLogic();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String uri = request.getRequestURI(); // /buddy1/memberList.member 요청
		String ctx = request.getContextPath();// /buddy1 저장
		String command = uri.substring(ctx.length()); // memberList.member
		// 공지사항 목록조회
		if (command.equals("/noticeList.notice"))
		{
			List<NoticeVo> nlist = adminNoticeLogic.noticeList();
			request.setAttribute("nlist", nlist);
			request.getRequestDispatcher("AdminNotice/noticeList.jsp").forward(request, response);
		}

		// 이름으로 검색후 조회
		else if (command.equals("/noticeListSearch.notice"))
		{
			String notice_title = request.getParameter("notice_title");
			List<NoticeVo> nList = adminNoticeLogic.noticeListSearch(notice_title);
			request.setAttribute("nlist", nList);
			request.getRequestDispatcher("AdminNotice/noticeList.jsp").forward(request, response);

		}

		// 회원 상세조회
		else if (command.equals("/noticeDetail.notice"))
		{
			String notice_title = request.getParameter("notice_title");
			NoticeVo noticeVo = new NoticeVo();
			noticeVo = adminNoticeLogic.noticeDetail(notice_title);
			request.setAttribute("noticeVo", noticeVo);
			request.getRequestDispatcher("AdminNotice/noticeDetail.jsp").forward(request, response);

		}

		// 공지사항 글생성
		else if (command.equals("/noticeInsert.notice"))
		{
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_content");

			NoticeVo noticeVo = new NoticeVo(notice_title, notice_content);
			int result = adminNoticeLogic.noticeInsert(noticeVo);

			if (result > 0)
			{
				response.sendRedirect("/birdie/noticeList.notice");
			}

			else
			{
				System.out.println("오류가 났어요");
			}

		}

		// 공지사항 글삭제
		else if (command.equals("/noticeDelete.notice"))
		{
			int notice_no = Integer.parseInt(request.getParameter("notice_no"));
			int result = adminNoticeLogic.noticeDelete(notice_no);

			if (result > 0)
			{
				response.sendRedirect("/birdie/noticeList.notice");
			}

			else
			{
				System.out.println("오류가 났어요");
			}

		}

	} // end of service

}// end of class
