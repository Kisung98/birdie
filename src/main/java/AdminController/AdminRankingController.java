package AdminController;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminDao.AdminMemberDao;
import AdminDao.AdminRankingDao;
import AdminDao.AdminReservationDao;
import AdminLogic.AdminRankingLogic;
import Vo.MemberVo;
import Vo.ReservationVo;

@WebServlet("*.ranking")
public class AdminRankingController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	AdminRankingLogic adminRankingLogic = new AdminRankingLogic();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String uri = request.getRequestURI(); // /buddy1/memberList.member 요청
		String ctx = request.getContextPath();// /buddy1 저장
		String command = uri.substring(ctx.length()); // memberList.member

		if (command.equals("/rankingList.ranking"))
		{

			List<Map<String, Object>> rlist = adminRankingLogic.rankingList();
			request.setAttribute("rankinglist", rlist);
			request.getRequestDispatcher("AdminRanking/rankingList.jsp").forward(request, response);
		}

	}
}
