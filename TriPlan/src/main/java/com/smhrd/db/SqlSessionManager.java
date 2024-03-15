package com.smhrd.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis 설정파일을 읽어 DB와 연결 후 세션을 반환

public class SqlSessionManager {

	private static SqlSessionFactory sqlSessionFactory;

	// static : 객체(SqlSessionManager)를 호출할때 무조건 자동으로 한번 실행
	static {

		try {

			String resource = "com/smhrd/db/mybatis-config.xml";

			InputStream inputStream = Resources.getResourceAsStream(resource);

			// DB 연결을 미리 해놓는 방식(Connection pool : CP)
			// DB 연결할때마다 낭비되던 자원을 아낄 수 있음
			// Connection 객체를 미리 만들어 놓고 빌려쓰고 반납하는 식으로 DB관리
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// DAO에서 호출
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}