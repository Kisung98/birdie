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
import AdminDao.AdminReservationDao;
import AdminLogic.AdminReservationLogic;
import Vo.MemberVo;
import Vo.ReservationVo;

@WebServlet("*.reservation")
public class AdminReservationController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	AdminReservationLogic adminReservationLogic = new AdminReservationLogic();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String uri = request.getRequestURI(); // /buddy1/memberList.member 요청
		String ctx = request.getContextPath();// /buddy1 저장
		String command = uri.substring(ctx.length()); // memberList.member

		if (command.equals("/reservationList.reservation"))
		{
			AdminReservationDao reservationDao = new AdminReservationDao();
			List<Map<String, Object>> rlist = adminReservationLogic.reservationList();
			request.setAttribute("rlist", rlist);
			request.getRequestDispatcher("AdminReservation/reservationList.jsp").forward(request, response);
		}

		// 이름으로 검색후 조회
		else if (command.equals("/reservationListSearch.reservation"))
		{
			String mem_name = request.getParameter("mem_name");
			List<Map<String, Object>> rlist = adminReservationLogic.reservationListSearch(mem_name);
			request.setAttribute("rlist", rlist);
			request.getRequestDispatcher("AdminReservation/reservationList.jsp").forward(request, response);

		}

		else if (command.equals("/reservationDetail.reservation"))
		{
			int res_no = Integer.parseInt(request.getParameter("res_no"));
			Map<String, Object> rmap = adminReservationLogic.reservationDetail(res_no);
			request.setAttribute("reservation", rmap);
			request.getRequestDispatcher("AdminReservation/reservationDetail.jsp").forward(request, response);

		}

		else if (command.equals("/reservationDelete.reservation"))
		{
			int res_no = Integer.parseInt(request.getParameter("res_no"));
			int result = adminReservationLogic.reservationDelete(res_no);

			if (result > 0)
			{
				response.sendRedirect("/birdie/reservationList.reservation");
			}

			else
			{
				System.out.println("삭제에러");
			}

		}

	}

}
