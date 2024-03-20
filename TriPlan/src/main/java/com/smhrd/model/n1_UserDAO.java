package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class n1_UserDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int Join(n1_UserVO joinUser) {
		SqlSession session = sqlSessionFactory.openSession(true);//auto commit
		
		int cnt = session.insert("com.smhrd.db.UserMapper.Join", joinUser);
		
		return cnt;
	}
	
}
