package AdminController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminDao.AdminQnaDao;
import AdminLogic.AdminQnaLogic;
import Vo.NoticeVo;
import Vo.QnaVo;

@WebServlet("*.qna")
public class AdminQnaController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	AdminQnaLogic adminQnaLogic = new AdminQnaLogic();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());

		// qna 목록보기
		if (command.equals("/qnaList.qna"))
		{
			List<QnaVo> qlist = adminQnaLogic.qnaList();
			request.setAttribute("qlist", qlist);
			request.getRequestDispatcher("AdminQna/qnaList.jsp").forward(request, response);
		}

		// 이름으로 검색후 조회
		else if (command.equals("/qnaListSearch.qna"))
		{
			String qna_title = request.getParameter("qna_title");
			List<QnaVo> qList = adminQnaLogic.qnaListSearch(qna_title);
			request.setAttribute("qlist", qList);
			request.getRequestDispatcher("AdminQna/qnaList.jsp").forward(request, response);

		}

		// qna 상세조회
		else if (command.equals("/qnaDetail.qna"))
		{
			String qna_title = request.getParameter("qna_title");
			QnaVo qnaVo = new QnaVo();
			qnaVo = adminQnaLogic.qnaDetail(qna_title);
			request.setAttribute("qnaVo", qnaVo);
			request.getRequestDispatcher("AdminQna/qnaDetail.jsp").forward(request, response);

		}

		// qna답변
		else if (command.equals("/qnaAnswer.qna"))
		{
			int qna_no = Integer.parseInt(request.getParameter("qna_no"));
			String qna_answer = request.getParameter("qna_answer");

			QnaVo qnaVo = new QnaVo(qna_no, qna_answer);
			int result = adminQnaLogic.qnaAnswer(qnaVo);

			if (result > 0)
			{
				response.sendRedirect("/birdie/qnaList.qna");
			}

			else
			{
				System.out.println("답변입력오류");
			}

		}

	}

}
