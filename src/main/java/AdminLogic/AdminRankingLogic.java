package AdminLogic;

import java.util.List;
import java.util.Map;

import AdminDao.AdminRankingDao;

public class AdminRankingLogic
{

	AdminRankingDao adminRankingDao = new AdminRankingDao();

	public List<Map<String, Object>> rankingList()
	{
		List<Map<String, Object>> rlist = adminRankingDao.rankingList();
		return rlist;
	}

}
