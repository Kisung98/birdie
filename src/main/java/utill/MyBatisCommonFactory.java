package utill;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MyBatisCommonFactory
{
	static Logger logger = Logger.getLogger(MyBatisCommonFactory.class);
	public static SqlSessionFactory sqlSessionFactory = null;

	public static void init()
	{
		try
		{
			// db연결 정보가 담긴 xml 파일을 resource 변수에 담아줌
			String resource = "MybatisConnection/MapperConfig.xml";

			// resource 변수를 읽어준다
			Reader reader = Resources.getResourceAsReader(resource);

			// 읽은 xml을 토대로 sqlsessionfactory에 객체주입을 해준다
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader, "development");

		}

		catch (Exception e)
		{
			logger.info("[[ Exception ]] " + e.toString());
		}
	}


	public static SqlSessionFactory getSqlSessionFactory()
	{
		init();
		return sqlSessionFactory;
	}
}
