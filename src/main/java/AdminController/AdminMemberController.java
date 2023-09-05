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
import AdminLogic.AdminMemberLogic;
import Vo.MemberVo;

@WebServlet("*.member")
public class AdminMemberController extends HttpServlet
{
	Logger logger = Logger.getLogger(AdminMemberController.class);
	private static final long serialVersionUID = 1L;
	AdminMemberLogic adminMemberLogic = new AdminMemberLogic();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String uri = request.getRequestURI(); // /buddy1/memberList.member 요청
		String ctx = request.getContextPath();// /buddy1 저장
		String command = uri.substring(ctx.length()); // memberList.member
		// 회원전체조회
		if (command.equals("/memberList.member"))
		{
			List<MemberVo> mlist = adminMemberLogic.memberList();
			request.setAttribute("mlist", mlist);
			request.getRequestDispatcher("AdminMember/memberList.jsp").forward(request, response);
		}

		// 이름으로 검색후 조회
		else if (command.equals("/memberListSearch.member"))
		{
			logger.info("조회검색");
			String mem_name = request.getParameter("mem_name");
			List<MemberVo> mlist = adminMemberLogic.memberListSearch(mem_name);
			request.setAttribute("mlist", mlist);
			request.getRequestDispatcher("AdminMember/memberList.jsp").forward(request, response);

		}

		// 회원가입시 멤버테이블에 삽입
		else if (command.equals("/memberInsert.member"))
		{

			String mem_id = request.getParameter("mem_id");
			String mem_password = request.getParameter("mem_password");
			String mem_name = request.getParameter("mem_name");
			String mem_phone = request.getParameter("mem_phone");
			String mem_gender = request.getParameter("mem_gender");

			MemberVo membervo = new MemberVo(mem_id, mem_password, mem_name, mem_phone, mem_gender);

			int result = adminMemberLogic.memberInsert(membervo);

			if (result > 0)
			{
				response.sendRedirect("/birdie/memberList.member");
			}

			else
			{
				System.out.println("오류가났어용");
			}

		}

	} // end of service

}// end of class
