package AdminLogic;

import java.util.List;

import AdminDao.AdminMemberDao;
import Vo.MemberVo;

public class AdminMemberLogic
{

	AdminMemberDao adminMemberDao = new AdminMemberDao();

	public List<MemberVo> memberList()
	{
		List<MemberVo> mlist = adminMemberDao.memberList();
		return mlist;
	}


	public List<MemberVo> memberListSearch(String mem_name)
	{
		List<MemberVo> mlist = adminMemberDao.memberListSearch(mem_name);
		return mlist;
	}


	public int memberInsert(MemberVo membervo)
	{
		int result = adminMemberDao.memberInsert(membervo);
		return result;
	}

}
