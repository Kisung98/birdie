package AdminLogic;

import java.util.List;
import java.util.Map;

import AdminDao.AdminReservationDao;

public class AdminReservationLogic
{

	AdminReservationDao adminReservationDao = new AdminReservationDao();

	public List<Map<String, Object>> reservationList()
	{
		List<Map<String, Object>> rlist = adminReservationDao.reservationList();
		return rlist;
	}


	public List<Map<String, Object>> reservationListSearch(String mem_name)
	{
		List<Map<String, Object>> rlist = adminReservationDao.reservationListSearch(mem_name);
		return rlist;
	}


	public Map<String, Object> reservationDetail(int res_no)
	{
		Map<String, Object> rMap = adminReservationDao.reservationDetail(res_no);
		return rMap;
	}


	public int reservationDelete(int res_no)
	{
		int result = adminReservationDao.reservationDelete(res_no);
		return result;
	}

}
